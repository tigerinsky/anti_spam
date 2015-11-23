#ifndef __BASE_MODEL_H_
#define __BASE_MODEL_H_

namespace cls {

class ModelStandardInput;

class BaseModel {
public:
    BaseModel() {}
    virtual ~BaseModel() {}

    virtual int predict(ModelStandardInput* input, double& result) = 0;
};

}

#endif      // __BASE_MODEL_H_
