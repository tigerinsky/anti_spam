#ifndef __THREAD_DATA_H_
#define __THREAD_DATA_H_

#include "../svm_model/svm_standard_input.h"
#include <string>
#include <sstream>

namespace cls {

class TimerCluster {
public:
    time_t svm_transform_time;      // svm转换耗时
    time_t svm_predict_time;        // svm运行耗时
    time_t segmentation_time;       // 切词耗时

    TimerCluster();
    virtual ~TimerCluster();

    const std::string& print_all();

private:
    std::string _log_buf;
    std::stringstream _str_stream;
};

class ThreadData {
public:
    SvmStandardInput* svm_standard_input;
    TimerCluster* timer_cluster;
    ThreadData() {
        svm_standard_input = new(std::nothrow) SvmStandardInput();
        timer_cluster = new(std::nothrow) TimerCluster();
    }
    bool is_valid();
};

}

#endif      // __THREAD_DATA_H_
