#ifndef __MAIN_SERVICE_IMPL_H_
#define __MAIN_SERVICE_IMPL_H_

#include <vector>

#include "../interface/MainService.h"

namespace cls {

class Segmentation;
class ModelStandardTransformer;
class BaseModel;

class MainServiceImpl : virtual public MainServiceIf {
public:
    MainServiceImpl();
    virtual ~MainServiceImpl();

public:
    int init();
    void AntiSpam(AntiSpamResponse& , const AntiSpamRequest& request);

private:
    Segmentation *_segmentation;
    ModelStandardTransformer *_standard_transformer;
    BaseModel* _model;
};

}

#endif      // __MAIN_SERVICE_IMPL_H_
