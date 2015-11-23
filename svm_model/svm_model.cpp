#include "svm_model.h"

#include <fstream>
#include "glog/logging.h"
#include "svm_standard_input.h"
#include "../utils/timer.h"

namespace cls {

SvmModel::SvmModel() : _svm_model(NULL) {
}

SvmModel::~SvmModel() {
    if (_svm_model) svm_free_and_destroy_model(&_svm_model);
}

int SvmModel::init(const std::string& svm_model_file) {
    utils::Timer timer;
    int i_ret = -1;

    _svm_model_file = svm_model_file;

    std::ifstream ifile_str(_svm_model_file.c_str());
    if (!ifile_str) {
        LOG(ERROR) << "file " << _svm_model_file << " not exist.";
        return 2;
    }
    ifile_str.close();

    _svm_model = svm_load_model(_svm_model_file.c_str());
    if (NULL == _svm_model) {
        LOG(ERROR) << "svm load model failed, ret=" << i_ret;
        return 1;
    }

    LOG(INFO) << "SvmModel init time=" << timer.elapse() / 1000.0;

    return 0;
}

int SvmModel::predict(ModelStandardInput* input, double& result) {
    SvmStandardInput* svm_input =
        dynamic_cast<SvmStandardInput*>(input);
    if (NULL == svm_input) {
        LOG(WARNING) << "svm-input dynamic_cast failed.";
        return 1;
    }
    svm_node* svm_nodes = svm_input->get_svm_nodes();
    if (NULL == svm_nodes) {
        LOG(WARNING) << "svm nodes is null.";
        return 2;
    }

    result = svm_predict(_svm_model, svm_nodes);

    return 0;
}

}
