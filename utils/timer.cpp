#include "timer.h"

namespace cls { namespace utils {

Timer::Timer() {
    reset();
}

Timer::~Timer() {
}

time_t Timer::elapse() {
    gettimeofday(&_end, 0);
    return (_end.tv_sec-_start.tv_sec) * 1000000
        + _end.tv_usec - _start.tv_usec;
}

void Timer::reset() {
    gettimeofday(&_start, 0);
    _end = _start;
}

}}
