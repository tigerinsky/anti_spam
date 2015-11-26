#include "main_service_impl.h"

#include <cmath>
#include <iomanip>
#include <string>
#include "glog/logging.h"
#include "../flag.h"
#include "../utils/utils.h"
#include "../utils/singleton.h"
#include "../utils/timer.h"
#include "../base/thread_data.h"

#include "../segmentation/segmentation.h"

#include "../svm_model/svm_standard_transformer.h"

#include "../svm_model/svm_model.h"

namespace cls {

__thread ThreadData* thread_data = NULL;

MainServiceImpl::MainServiceImpl() : _segmentation(NULL),
                                    _standard_transformer(NULL),
                                    _model(NULL) {
}

MainServiceImpl::~MainServiceImpl() {
    if (_segmentation) delete _segmentation;
    if (_standard_transformer) delete _standard_transformer;
    if (_model) delete _model;
}

int MainServiceImpl::init() {
    int i_ret = -1;
    LOG(INFO) << "Start init segmentation.";
    _segmentation = new(std::nothrow) Segmentation();
    if (NULL == _segmentation) {
        LOG(ERROR) << "segmentation create failed.";
        return 1;
    }
    if (_segmentation->init(FLAGS_segment_resource_dir)) {
        LOG(ERROR) << "segmentation init failed.";
        return 2;
    }
    LOG(INFO) << "Start init standard transformer.";
    SvmStandardTransformer* svm_transformer =
        new(std::nothrow) SvmStandardTransformer();
    if (NULL == svm_transformer) {
        LOG(ERROR) << "svm standard transformer create failed.";
        return 3;
    }
    i_ret = svm_transformer->init(FLAGS_segment_index_file,
            FLAGS_index_scale_file,
            _segmentation);
    if (i_ret) {
        LOG(ERROR) << "svm_transformer init failed.";
        return 4;
    }
    _standard_transformer = dynamic_cast<ModelStandardTransformer*>(svm_transformer);
    if (NULL == _standard_transformer) {
        LOG(ERROR) << "svm standard tansformer dynamic_cast to base failed.";
        return 5;
    }
    LOG(INFO) << "Start init model.";
    SvmModel* svm_model = new(std::nothrow) SvmModel();
    if (NULL == svm_model) {
        LOG(ERROR) << "svm model create failed.";
        return 6;
    }
    i_ret = svm_model->init(FLAGS_simple_seg_svm_model_file);
    if (i_ret) {
        LOG(ERROR) << "svm model init failed.";
        return 7;
    }
    _model = dynamic_cast<SvmModel*>(svm_model);
    if (NULL == _model) {
        LOG(ERROR) << "svm model dynamic_cast to model failed.";
        return 8;
    }

    return 0;
}

void MainServiceImpl::AntiSpam(AntiSpamResponse& _return, const AntiSpamRequest& request) {
    utils::Timer timer;
    int i_ret = -1;
    double result = 0.0;
    // 初始化线程数据
    utils::Singleton<ThreadData>::get_instance(thread_data);
    if (NULL == thread_data || !thread_data->is_valid()) {
        LOG(WARNING) << "thread_data is null.";
        return ;
    }
    SvmStandardTransformer* svm_transformer =
        dynamic_cast<SvmStandardTransformer*>(_standard_transformer);
    if (svm_transformer) {
        i_ret = thread_data->
            svm_standard_input->init_svm_nodes(svm_transformer->get_feature_size());
        if (i_ret) {
            LOG(WARNING) << "init svm nodes failed.";
            return ;
        }
    }

    ModelStandardInput* model_standard_input = dynamic_cast<ModelStandardInput*>(thread_data->svm_standard_input);
    if (NULL == model_standard_input) {
        LOG(WARNING) << "svm standard input is null.";
        return ;
    }
    
    i_ret = _standard_transformer->transform(request.content, model_standard_input);
    if (i_ret) {
        LOG(WARNING) << "transform failed, ret=" << i_ret;
        return ;
    }
    thread_data->timer_cluster->svm_transform_time = timer.elapse();
    timer.reset();
    
    i_ret = _model->predict(model_standard_input, result);
    if (i_ret) {
        LOG(WARNING) << "predict failed, ret=" << i_ret;
        return ;
    }
    thread_data->timer_cluster->svm_predict_time = timer.elapse();

    _return.is_spam = utils::round_int(result);
    LOG(INFO) << "result=" << result
        << " " << thread_data->timer_cluster->print_all();

}

}
