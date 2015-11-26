#ifndef __FLAG_H_
#define __FLAG_H_

#include "google/gflags.h"

DECLARE_int32(server_port);
DECLARE_int32(server_thread_num);
DECLARE_string(segment_resource_dir);
DECLARE_string(segment_index_file);
DECLARE_string(simple_seg_svm_model_file);
DECLARE_string(index_scale_file);

#endif      // __FLAG_H_
