namespace cpp cls
namespace php anti_spam
namespace py cls

include "anti_spam.thrift"

service MainService {
    anti_spam.AntiSpamResponse AntiSpam(1:anti_spam.AntiSpamRequest request)
}
