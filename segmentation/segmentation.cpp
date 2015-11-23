#include "segmentation.h"

#include "glog/logging.h"
#include "../lib/seg/include/segment.h"
#include "../utils/timer.h"

namespace cls {

Segmentation::Segmentation() : _segment_mem(NULL) {

}

Segmentation::~Segmentation() {
    if (_segment_mem) delete _segment_mem;
}

int Segmentation::init(const std::string& resource_dir) {
    utils::Timer timer;
    _resource_dir = resource_dir;

    if (reload()) {
        LOG(ERROR) << "reload segmentation resource dir failed.";
        return 1;
    }

    LOG(INFO) << "segmentation init time=" << timer.elapse() / 1000.0;

    return 0;
}

int Segmentation::reload() {
    using tis::Segment;

    int i_ret = -1;

    i_ret = Segment::init(_resource_dir.c_str());
    if (0 != i_ret) {
        LOG(ERROR) << "Segment init error, ret=" << i_ret;
        return 1;
    }

    _segment_mem = Segment::create(k_max_segment_token_num);
    if (NULL == _segment_mem) {
        LOG(ERROR) << "Segment create error.";
        return 2;
    }

    return 0;
}

int Segmentation::segment_words(const std::string& str, std::vector<std::string>& result) {
    int i_ret = -1;
    std::vector<tis::token_t> token_list;

    i_ret = _segment_mem->segment(str.c_str(), str.size());
    if (0 != i_ret) {
        LOG(WARNING) << "segment failed,"
            << " ret=" << i_ret
            << " str=" << str;
        return 1;
    }

    _segment_mem->get_basic_tokens(token_list);

    result.clear();
    for (std::vector<tis::token_t>::iterator vec_itr = token_list.begin();
            vec_itr != token_list.end(); vec_itr++) {
        result.push_back(vec_itr->str);
    }

    return 0;
}

}
