#ifndef __SERVER_H_
#define __SERVER_H_

namespace apache { namespace thrift { namespace server {
class TNonblockingServer;
}}}

namespace cls {

class MainServer {
public:
    MainServer();
    ~MainServer();

    int init();
    int run();
    void stop();

protected:

private:
    apache::thrift::server::TNonblockingServer* _server;
};

}

#endif      // __SERVER_H_
