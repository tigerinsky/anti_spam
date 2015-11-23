#ifndef __SVM_STANDARD_TRANSFORMER_H_
#define __SVM_STANDARD_TRANSFORMER_H_

#include <string>
#include <stack>
#include <pthread.h>
#include <boost/unordered_map.hpp>
#include "../lib/svm/include/svm.h"
#include "../base/model_standard_input.h"
#include "../base/model_standard_transformer.h"

namespace cls {

class Segmentation;

const int k_svm_node_mem_inc_length = 32;

class SvmStandardTransformer : public ModelStandardTransformer {
public:
    SvmStandardTransformer();
    virtual ~SvmStandardTransformer();

    size_t get_feature_size() const { return _feature_size; }
    int init(const std::string& segment_index_file,
            Segmentation* segmentation);
    int load_segment_index();
    int transform(const std::string& content, ModelStandardInput* standard_input);

private:
    bool isNum(std::string);
    bool isDict(std::string);
    bool isLatin(std::string);

private:
    std::string _segment_index_file;
    boost::unordered_map<std::string, size_t> _term_index;
    Segmentation* _segmentation;
    size_t _feature_size;
};

}

#endif      // __SVM_STANDARD_TRANSFORMER_H_
