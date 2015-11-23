#include "thread_data.h"
#include "glog/logging.h"

namespace cls {

TimerCluster::TimerCluster() {
    svm_transform_time = time_t(0);
    svm_predict_time = time_t(0);
}

TimerCluster::~TimerCluster() {
}

const std::string& TimerCluster::print_all() {
    std::string tmp_buf;
    _log_buf.clear();
    _str_stream.clear();
    _str_stream << "svm_transform_time=" << svm_transform_time/1000.0
                << " svm_predict_time=" << svm_predict_time/1000.0
                << " segmentation_time=" << segmentation_time/1000.0;
    while (_str_stream >> tmp_buf && (_log_buf += tmp_buf, !_str_stream.eof())) {
        _log_buf += ' ';
    }

    return _log_buf;
}

bool ThreadData::is_valid() {
    if (NULL == svm_standard_input) {
        LOG(WARNING) << "svm_standard_input is null.";
        return false;
    }
    if (NULL == timer_cluster) {
        LOG(WARNING) << "timer_cluster is null.";
        return false;
    }

    return true;
}

}
