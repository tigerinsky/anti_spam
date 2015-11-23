#ifndef __UTILS_H_
#define __UTILS_H_

namespace cls { namespace utils {

inline int round_int(double num) {
    return num > 0 ?
        static_cast<int>(num + 0.5) :
        static_cast<int>(num - 0.5);
}
}}

#endif      // __UTILS_H_
