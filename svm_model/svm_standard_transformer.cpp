#include "svm_standard_transformer.h"

#include <set>
#include <fstream>
#include <iostream>
#include <string>
#include <sstream>

#include <boost/format.hpp>  
#include <boost/tokenizer.hpp>  
#include <boost/algorithm/string.hpp> 

#include "glog/logging.h"
#include "../segmentation/segmentation.h"
#include "svm_standard_input.h"
#include "../utils/timer.h"
#include "../base/thread_data.h"

namespace cls {

extern __thread struct ThreadData* thread_data;

SvmStandardTransformer::SvmStandardTransformer() : _segmentation(NULL),
                                                lower(-1),
                                                upper(1) {
    _feature_size = 0;
}

SvmStandardTransformer::~SvmStandardTransformer() {
}

int SvmStandardTransformer::init(const std::string& segment_index_file,
                            const std::string& index_scale_file,
                            Segmentation* segmentation) {
    utils::Timer timer;
    int i_ret = -1;
    _segment_index_file = segment_index_file;
    _index_scale_file = index_scale_file;
    _segmentation = segmentation;

    i_ret = load_segment_index();
    if (0 != i_ret) {
        LOG(ERROR) << "load_segment_index failed, ret=" << i_ret;
        return 1;
    }
    _feature_size = _term_index.size();

    i_ret = load_index_scale();
    if (0 != i_ret) {
        LOG(ERROR) << "load_index_scale failed, ret=" << i_ret;
        return 1;
    }

    LOG(INFO) << "SvmStandardTransformer init time=" << timer.elapse() / 1000.0;

    return 0;
}

bool SvmStandardTransformer::isNum(std::string str)
{
    std::stringstream sin(str);
    double d;
    char c;
    if(!(sin >> d))
        return false;
    if (sin >> c)
        return false;
    return true;
}

bool SvmStandardTransformer::isDict(std::string str) {
    std::string dict[5] = {"weixin", "q", "qq", "Q", "QQ"};
    for (int i = 0; i < 5; i++) {
        if (dict[i].compare(str) == 0) {
            return true;
        }
    }
    return false;
}

bool SvmStandardTransformer::isLatin(std::string str)
{
    for (size_t i = 0; i < str.length(); i++) {
        if (str[i] < 0) {
            return false;
        }
    }
    return true;
}

int SvmStandardTransformer::load_segment_index() {
    std::ifstream file_str(_segment_index_file.c_str());

    if (!file_str) {
        LOG(ERROR) << "SegmentIndexDict file [" << _segment_index_file
            << "] not exist.";
        return 1;
    }
    _term_index.clear();
    std::string each_line;
    std::size_t sep_pos = 0;
    std::size_t first_pos = 0;
    std::string term_str;
    std::string index_str;
    std::stringstream stream_str;
    std::set<int> index_set;
    size_t index = 0;
    size_t max_index = 0;
    while (std::getline(file_str, each_line)) {
        // get term
        sep_pos = each_line.find('\t');
        if (std::string::npos == sep_pos) {
            LOG(WARNING) << "format error, line=[" << each_line << "]";
            continue;
        }
        term_str = each_line.substr(0, sep_pos);
        // get index
        first_pos = sep_pos + 1;
        sep_pos = each_line.find('\t', sep_pos + 1);
        if (std::string::npos == sep_pos) {
            sep_pos = each_line.size();
        }
        index_str = each_line.substr(first_pos, sep_pos - first_pos);
        stream_str.clear();
        stream_str << index_str;
        stream_str >> index;
        if (index_set.end() != index_set.find(index)) {
            LOG(ERROR) << "index repeat, line=[" << each_line << "]";
            file_str.close();
            return 2;
        }
        index_set.insert(index);
        _term_index[term_str] = index;
        if (max_index < index) {
            max_index = index;
        }
    }
    // double check
    if (max_index != _term_index.size()) {
        LOG(ERROR) << "max-index != dict.size(), "
            << max_index << " != " << _term_index.size();
        file_str.close();
        return 3;
    }

    file_str.close();

    return 0;
}

int SvmStandardTransformer::load_index_scale() {
    upper = 1;
    lower = -1;

    std::ifstream file(_index_scale_file.c_str());
    if (!file) {
        LOG(ERROR) << "Index scale file [" << _index_scale_file
            << "] not exist.";
        return 1;
    }
    std::string line;
    // read first line: x
    std::getline(file, line);
    // read second line: min and max
    std::getline(file, line);

    //loop read
    size_t line_num = 0;
    while (std::getline(file, line)) {
        // create separator
        boost::char_separator<char> sep(" ");         
        typedef boost::tokenizer< boost::char_separator<char> >  
                        CustonTokenizer; 
        // split string
        CustonTokenizer tok(line, sep);  
        // process element of string
        CustonTokenizer::iterator it=tok.begin();
        size_t index = static_cast<size_t>(atoi((*it).c_str()) - 1);
        if (index != line_num) {
            LOG(ERROR) << "index != line_num, "
                << index << " != " << line_num;
            file.close();
            return 2;
        }
        _feature_min.push_back(atof((*(++it)).c_str()));
        _feature_max.push_back(atof((*(++it)).c_str()));
        line_num++;
    }

    file.close();
    return 0;
}

int SvmStandardTransformer::transform(const std::string& content,
                                        ModelStandardInput* standard_input) {
    int i_ret = -1;
    // transform string to term
    std::vector<std::string> term_list;
    SvmStandardInput* svm_input = dynamic_cast<SvmStandardInput*>(standard_input);
    if (NULL == svm_input) {
        LOG(WARNING) << "svm standard-input dynamic_cast failed.";
        return 3;
    }
    svm_node* svm_nodes = svm_input->get_svm_nodes();
    if (NULL == svm_nodes) {
        LOG(WARNING) << "svm nodes is null.";
        return 4;
    }

    utils::Timer timer;
    i_ret = _segmentation->segment_words(content, term_list);
    if (0 != i_ret) {
        LOG(WARNING) << "segment_words failed.";
        return 1;
    }
    thread_data->timer_cluster->segmentation_time = timer.elapse();
    // transform terms to vector
    size_t index = 0;
    for (size_t i = 0; i < _feature_size; i++) {
        svm_nodes[i].index = i + 1;
        svm_nodes[i].value = -1;
    }
    svm_nodes[_feature_size].index = -1;
    for (size_t i = 0; i < term_list.size(); i++) {
        index = 0;
        std::string tmp = term_list[i];
        if (isNum(term_list[i])) {
            tmp = "number";
        } else if (isDict(term_list[i])) {
            tmp = term_list[i];
        } else if (isLatin(term_list[i])) {
            tmp = "latin";
        }
        boost::unordered_map<std::string, size_t>::const_iterator map_itr =
            _term_index.find(tmp);
        if (_term_index.end() != map_itr) {
            index = map_itr->second;
        }
        if (index > 0) {
            if (index > _feature_size) {
                LOG(WARNING) << "index > _feature_size, " << index << " > " << _feature_size;
                return 2;
            }
            if (svm_nodes[index - 1].value == -1) {
                svm_nodes[index - 1].value = 1;
            } else {
                svm_nodes[index - 1].value++;
            }
        }
    }

    // feature scale
    for (size_t i = 0; i < _feature_size; i++) {
        if(_feature_max[i] == _feature_min[i])
            continue;

        if(svm_nodes[i].value == _feature_min[index])
            svm_nodes[i].value = lower;
        else if(svm_nodes[i].value == _feature_max[index])
            svm_nodes[i].value = upper;
        else
            svm_nodes[i].value = lower + (upper-lower) *
                        (svm_nodes[i].value - _feature_min[index])/
                        (_feature_max[index] - _feature_min[index]);
    }

    return 0;
}

}
