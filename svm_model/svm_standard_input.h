#ifndef __SVM_STANARD_INPUT_H_
#define __SVM_STANARD_INPUT_H_

#include "../base/model_standard_input.h"
#include "../lib/svm/include/svm.h"

namespace cls {

class SvmStandardInput : public ModelStandardInput {
public:
    SvmStandardInput();
    virtual ~SvmStandardInput();

    svm_node* get_svm_nodes();
    int init_svm_nodes(int feature_size);

private:
    svm_node* _svm_nodes;
};

}

#endif      // __SVM_STANARD_INPUT_H_
