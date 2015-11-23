#ifndef __SINGLETON_H_
#define __SINGLETON_H_

#include <cstddef>
#include <new>

namespace cls { namespace utils {

template <typename T>
class Singleton {
public:
    static void get_instance(T*& instance) {
        if (NULL == instance) {
            instance = new(std::nothrow) T();
        }
    }

};

}}

#endif      // __SINGLETON_H_
