#ifndef __MODEL_STANDARD_INPUT_H_
#define __MODEL_STANDARD_INPUT_H_

namespace cls {

class ModelStandardInput {
public:
    ModelStandardInput() {}
    virtual ~ModelStandardInput() {}

    virtual int init() { return 0; }
};

}

#endif      // __MODEL_STANDARD_INPUT_H_
