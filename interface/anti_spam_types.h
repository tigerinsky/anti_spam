/**
 * Autogenerated by Thrift Compiler (0.9.2)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#ifndef anti_spam_TYPES_H
#define anti_spam_TYPES_H

#include <iosfwd>

#include <thrift/Thrift.h>
#include <thrift/TApplicationException.h>
#include <thrift/protocol/TProtocol.h>
#include <thrift/transport/TTransport.h>

#include <thrift/cxxfunctional.h>


namespace cls {

class AntiSpamRequest;

class AntiSpamResponse;

typedef struct _AntiSpamRequest__isset {
  _AntiSpamRequest__isset() : content(false) {}
  bool content :1;
} _AntiSpamRequest__isset;

class AntiSpamRequest {
 public:

  static const char* ascii_fingerprint; // = "EFB929595D312AC8F305D5A794CFEDA1";
  static const uint8_t binary_fingerprint[16]; // = {0xEF,0xB9,0x29,0x59,0x5D,0x31,0x2A,0xC8,0xF3,0x05,0xD5,0xA7,0x94,0xCF,0xED,0xA1};

  AntiSpamRequest(const AntiSpamRequest&);
  AntiSpamRequest& operator=(const AntiSpamRequest&);
  AntiSpamRequest() : content() {
  }

  virtual ~AntiSpamRequest() throw();
  std::string content;

  _AntiSpamRequest__isset __isset;

  void __set_content(const std::string& val);

  bool operator == (const AntiSpamRequest & rhs) const
  {
    if (!(content == rhs.content))
      return false;
    return true;
  }
  bool operator != (const AntiSpamRequest &rhs) const {
    return !(*this == rhs);
  }

  bool operator < (const AntiSpamRequest & ) const;

  uint32_t read(::apache::thrift::protocol::TProtocol* iprot);
  uint32_t write(::apache::thrift::protocol::TProtocol* oprot) const;

  friend std::ostream& operator<<(std::ostream& out, const AntiSpamRequest& obj);
};

void swap(AntiSpamRequest &a, AntiSpamRequest &b);

typedef struct _AntiSpamResponse__isset {
  _AntiSpamResponse__isset() : is_spam(false) {}
  bool is_spam :1;
} _AntiSpamResponse__isset;

class AntiSpamResponse {
 public:

  static const char* ascii_fingerprint; // = "E86CACEB22240450EDCBEFC3A83970E4";
  static const uint8_t binary_fingerprint[16]; // = {0xE8,0x6C,0xAC,0xEB,0x22,0x24,0x04,0x50,0xED,0xCB,0xEF,0xC3,0xA8,0x39,0x70,0xE4};

  AntiSpamResponse(const AntiSpamResponse&);
  AntiSpamResponse& operator=(const AntiSpamResponse&);
  AntiSpamResponse() : is_spam(0) {
  }

  virtual ~AntiSpamResponse() throw();
  int32_t is_spam;

  _AntiSpamResponse__isset __isset;

  void __set_is_spam(const int32_t val);

  bool operator == (const AntiSpamResponse & rhs) const
  {
    if (!(is_spam == rhs.is_spam))
      return false;
    return true;
  }
  bool operator != (const AntiSpamResponse &rhs) const {
    return !(*this == rhs);
  }

  bool operator < (const AntiSpamResponse & ) const;

  uint32_t read(::apache::thrift::protocol::TProtocol* iprot);
  uint32_t write(::apache::thrift::protocol::TProtocol* oprot) const;

  friend std::ostream& operator<<(std::ostream& out, const AntiSpamResponse& obj);
};

void swap(AntiSpamResponse &a, AntiSpamResponse &b);

} // namespace

#endif