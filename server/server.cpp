#include "server.h"

#include "thrift/protocol/TBinaryProtocol.h"
#include "thrift/concurrency/ThreadManager.h"
#include "thrift/concurrency/PosixThreadFactory.h"
#include "thrift/server/TNonblockingServer.h"

#include "glog/logging.h"
#include "../flag.h"
#include "../interface/MainService.h"
#include "../service/main_service_impl.h"

namespace cls {

MainServer::MainServer() {
    _server = NULL;
}

MainServer::~MainServer() {
    if (_server) delete _server;
}

int MainServer::init() {
    using boost::shared_ptr;
    using apache::thrift::protocol::TProtocolFactory;
    using apache::thrift::protocol::TBinaryProtocolFactory;
    using apache::thrift::TProcessor;                      
    using apache::thrift::concurrency::ThreadManager;      
    using apache::thrift::concurrency::PosixThreadFactory; 
    using apache::thrift::server::TNonblockingServer;
    using apache::thrift::TException;

    shared_ptr<MainServiceImpl> handler(new MainServiceImpl());
    // init server
    try {
        shared_ptr<TProtocolFactory> protocol_factory(new TBinaryProtocolFactory());
        shared_ptr<TProcessor> post_processor(new MainServiceProcessor(handler));
        shared_ptr<ThreadManager> thread_manager = ThreadManager::newSimpleThreadManager(FLAGS_server_thread_num);
        shared_ptr<PosixThreadFactory> thread_factory(new PosixThreadFactory());
        thread_manager->threadFactory(thread_factory);
        thread_manager->start();

        _server = new(std::nothrow) TNonblockingServer(post_processor,
                                                        protocol_factory,
                                                        FLAGS_server_port,
                                                        thread_manager);
        if (NULL == _server) {
            LOG(ERROR) << "create nonbolacking server error.";
            return 1;
        }
    } catch (TException& ex) {
        LOG(ERROR) << "thrift server exception, [" << ex.what() << "]";
        return 2;
    } catch (std::exception& ex) {
        LOG(ERROR) << "unkown excpetion: [" << ex.what() << "]";
        return 3;
    }

    // init processor
    if (handler->init()) {
        LOG(ERROR) << "Init processor failed.";
        return 1;
    }

    return 0;
}

int MainServer::run() {
    try {
        _server->serve();
    } catch (std::exception& ex) {
        LOG(ERROR) << "unkown excpetion: [" << ex.what() << "]";
        return 2;
    }

    return 0;
}

void MainServer::stop() {
    _server->stop();
}

}
