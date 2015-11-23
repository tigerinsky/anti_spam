#ifndef __SEGMENTATION_H_
#define __SEGMENTATION_H_

#include <string>
#include <vector>

namespace tis {
class Segment;
}

namespace cls {

const int k_max_segment_token_num = 1024;

class Segmentation {
public:
    Segmentation();
    virtual ~Segmentation();

    int init(const std::string& resource_dir);
    int reload();
    int segment_words(const std::string& str, std::vector<std::string>& result);

private:
    std::string _resource_dir;
    tis::Segment* _segment_mem;
};

}

#endif      // __SEGMENTATION_H_
