#ifndef __SVM_MODEL_H_
#define __SVM_MODEL_H_

#include <string>

#include "../base/base_model.h"
#include "../lib/svm/include/svm.h"

namespace cls {

class ModelStandardInput;

class SvmModel : public BaseModel {
public:
    SvmModel();
    virtual ~SvmModel();

    int init(const std::string& svm_model_file);
    int predict(ModelStandardInput* input, double& result);

private:
    std::string _svm_model_file;
    svm_model* _svm_model;

};

}

#endif      // __SVN_MODEL_H_
