#include <signal.h>
#include "flag.h"
#include "glog/logging.h"
#include "server/server.h"

cls::MainServer g_server;

DEFINE_int32(server_port, 9050, "Server port");
DEFINE_int32(server_thread_num, 2, "Server thread num");
DEFINE_string(segment_resource_dir, "./resource/chinese_utf8/", "Resource dir.");
DEFINE_string(segment_index_file, "./index/anti_spam_dict.txt", "Segment index file.");
DEFINE_string(simple_seg_svm_model_file, "./index/simple_seg_svm.model", "simple svm model.");
DEFINE_string(index_scale_file, "./index/anti_spam_scale_parameters", "index scale file.");

void handle_signal(int sig) {
    g_server.stop();
}

int main(int argc, char** argv) {
    int i_ret = -1;
    ::google::ParseCommandLineFlags(&argc, &argv, true);
    ::google::InitGoogleLogging(argv[0]);
    ::google::SetUsageMessage("anti-spam server");

    signal(SIGINT, handle_signal); 
    signal(SIGQUIT, handle_signal);
    signal(SIGPIPE, SIG_IGN);

    i_ret = g_server.init();
    if (0 != i_ret) {
        LOG(ERROR) << "MainServer init failed, ret=" << i_ret;
        return 1;
    }

    i_ret = g_server.run();
    if (0 != i_ret) {
        LOG(ERROR) << "MainServer run failed, ret=" << i_ret;
        return 2;
    }

    return 0;
}
