#ifndef __TIMER_H_
#define __TIMER_H_

#include <sys/time.h>

namespace cls { namespace utils {

class Timer {
public:
    Timer();
    virtual ~Timer();

    time_t elapse();
    void reset();

private:
    struct timeval _start;
    struct timeval _end;
};

}}

#endif      // __TIMER_H_
