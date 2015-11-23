#ifndef __MODEL_STANDARD_TRANSFORMER_H_
#define __MODEL_STANDARD_TRANSFORMER_H_

#include "model_standard_input.h"

namespace cls {

class ModelStandardTransformer {
public:
    ModelStandardTransformer() {}
    virtual ~ModelStandardTransformer () {}

    virtual int transform(const std::string& content, ModelStandardInput* standard_input) = 0;
};

}

#endif      // __MODEL_STANDARD_TRANSFORMER_H_
