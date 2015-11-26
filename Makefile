#---------- env ----------
CXX=g++
CXXFLAGS=-D_GNU_SOURCE -D__STDC_LIMIT_MACROS -g -pipe -W -Wall -fPIC -fno-omit-frame-pointer
INCPATH=-I. -I./include/ -I/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include -I/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include -I/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include
LIBPATH=-Xlinker "-(" -lunwind -lcrypto -levent -ldl -lpthread -lm -lrt /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/lib/svm/lib/libsvm.a /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/lib/seg/lib/libsegment.a /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/lib/seg/lib/libseg_ext.a /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/lib/libglog.a /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/lib/libgflags_nothreads.a /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/lib/libgflags.a /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/lib/libthriftz.a /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/lib/libthrift.a /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/lib/libthriftnb.a -Xlinker "-)"


#---------- phony ----------
.PHONY:all
all:prepare \
anti_spam \


.PHONY:prepare
prepare:
	mkdir -p ./output/bin

.PHONY:clean
clean:
	rm -rf /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/MainService.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_constants.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/server.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/main.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/segmentation/segmentation.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_types.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/utils.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_constants.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_transformer.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/timer.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/base/thread_data.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_input.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/main_service_impl.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_model.o ./output


#---------- link ----------
anti_spam:/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/MainService.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_constants.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/server.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/main.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/segmentation/segmentation.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_types.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/utils.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_constants.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_transformer.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/timer.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/base/thread_data.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_input.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/main_service_impl.o \
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_model.o \

	$(CXX) /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/MainService.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_constants.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/server.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/main.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/segmentation/segmentation.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_types.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/utils.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_constants.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_transformer.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/timer.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/base/thread_data.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_input.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/main_service_impl.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_model.o $(LIBPATH) -o ./output/bin/anti_spam



#---------- obj ----------
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/MainService.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/MainService.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/MainService.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TDispatchProcessor.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TProcessor.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocol.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransport.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/Thrift.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/PlatformSocket.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/thrift-config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TLogging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransportException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocolException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_types.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TApplicationException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/cxxfunctional.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/MainService.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/MainService.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_constants.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_constants.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_constants.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_types.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/Thrift.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/PlatformSocket.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/thrift-config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TLogging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TApplicationException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocol.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransport.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransportException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocolException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/cxxfunctional.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_constants.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_constants.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/server.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/server.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/server.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TBinaryProtocol.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocol.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransport.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/Thrift.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/PlatformSocket.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/thrift-config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TLogging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransportException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocolException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TVirtualProtocol.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TBinaryProtocol.tcc \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/concurrency/ThreadManager.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/cxxfunctional.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/concurrency/Thread.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/concurrency/PosixThreadFactory.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/server/TNonblockingServer.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/server/TServer.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TProcessor.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TServerTransport.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TBufferTransports.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TVirtualTransport.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TSocket.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TServerSocket.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/concurrency/PlatformThreadFactory.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/concurrency/Mutex.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/logging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags_declare.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/log_severity.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/vlog_is_on.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/../flag.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/google/gflags.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/../interface/MainService.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TDispatchProcessor.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/../interface/service_types.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TApplicationException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/../interface/anti_spam_types.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/../service/main_service_impl.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/../service/../interface/MainService.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/server.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/server.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/main.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/main.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/flag.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/google/gflags.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags_declare.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/logging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/log_severity.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/vlog_is_on.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/server/server.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/main.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/main.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/segmentation/segmentation.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/segmentation/segmentation.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/segmentation/segmentation.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/logging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags_declare.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/log_severity.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/vlog_is_on.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/segmentation/../lib/seg/include/segment.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/segmentation/../utils/timer.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/segmentation/segmentation.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/segmentation/segmentation.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_types.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_types.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_types.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/Thrift.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/PlatformSocket.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/thrift-config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TLogging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TApplicationException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocol.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransport.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransportException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocolException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/cxxfunctional.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TToString.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_types.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/service_types.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/utils.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/utils.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/utils.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/utils.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/utils.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_constants.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_constants.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_constants.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/Thrift.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/PlatformSocket.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/thrift-config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TLogging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TApplicationException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocol.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransport.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransportException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocolException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/cxxfunctional.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_constants.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_constants.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_transformer.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_transformer.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_transformer.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../lib/svm/include/svm.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../base/model_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../base/model_standard_transformer.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../base/model_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/logging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags_declare.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/log_severity.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/vlog_is_on.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../segmentation/segmentation.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../utils/timer.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../base/thread_data.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../base/../svm_model/svm_standard_input.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_transformer.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_transformer.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/timer.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/timer.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/timer.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/timer.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/utils/timer.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/base/thread_data.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/base/thread_data.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/base/thread_data.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/base/../svm_model/svm_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/base/../svm_model/../base/model_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/base/../svm_model/../lib/svm/include/svm.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/logging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags_declare.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/log_severity.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/vlog_is_on.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/base/thread_data.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/base/thread_data.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_input.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_input.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../base/model_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../lib/svm/include/svm.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_input.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_input.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/Thrift.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/PlatformSocket.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/thrift-config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TLogging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TApplicationException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocol.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransport.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransportException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocolException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/cxxfunctional.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TToString.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/interface/anti_spam_types.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/main_service_impl.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/main_service_impl.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/main_service_impl.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../interface/MainService.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TDispatchProcessor.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TProcessor.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocol.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransport.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/Thrift.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/PlatformSocket.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/thrift-config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/config.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TLogging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/transport/TTransportException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/protocol/TProtocolException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../interface/service_types.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/TApplicationException.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/thrift/include/thrift/cxxfunctional.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../interface/anti_spam_types.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/logging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags_declare.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/log_severity.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/vlog_is_on.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../flag.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/google/gflags.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../utils/utils.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../utils/singleton.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../utils/timer.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../base/thread_data.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../base/../svm_model/svm_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../base/../svm_model/../base/model_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../base/../svm_model/../lib/svm/include/svm.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../segmentation/segmentation.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../svm_model/svm_standard_transformer.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../svm_model/../lib/svm/include/svm.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../svm_model/../base/model_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../svm_model/../base/model_standard_transformer.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../svm_model/../base/model_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../svm_model/svm_model.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/../svm_model/../base/base_model.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/main_service_impl.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/service/main_service_impl.cpp
/data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_model.o: \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_model.cpp \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_model.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../base/base_model.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../lib/svm/include/svm.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/logging.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/gflags/include/gflags/gflags_declare.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/log_severity.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/glog/include/glog/vlog_is_on.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../base/model_standard_input.h \
 /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/../utils/timer.h
	$(CXX) $(INCPATH) $(CXXFLAGS) -c -o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_model.o /data/wangxuebing/development/cailianpress/backend/anti_spam_workspace/anti_spam/svm_model/svm_model.cpp


