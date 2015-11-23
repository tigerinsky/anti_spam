/**
 * Autogenerated by Thrift Compiler (0.9.2)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#include "anti_spam_types.h"

#include <algorithm>
#include <ostream>

#include <thrift/TToString.h>

namespace cls {


AntiSpamRequest::~AntiSpamRequest() throw() {
}


void AntiSpamRequest::__set_content(const std::string& val) {
  this->content = val;
}

const char* AntiSpamRequest::ascii_fingerprint = "EFB929595D312AC8F305D5A794CFEDA1";
const uint8_t AntiSpamRequest::binary_fingerprint[16] = {0xEF,0xB9,0x29,0x59,0x5D,0x31,0x2A,0xC8,0xF3,0x05,0xD5,0xA7,0x94,0xCF,0xED,0xA1};

uint32_t AntiSpamRequest::read(::apache::thrift::protocol::TProtocol* iprot) {

  uint32_t xfer = 0;
  std::string fname;
  ::apache::thrift::protocol::TType ftype;
  int16_t fid;

  xfer += iprot->readStructBegin(fname);

  using ::apache::thrift::protocol::TProtocolException;


  while (true)
  {
    xfer += iprot->readFieldBegin(fname, ftype, fid);
    if (ftype == ::apache::thrift::protocol::T_STOP) {
      break;
    }
    switch (fid)
    {
      case 1:
        if (ftype == ::apache::thrift::protocol::T_STRING) {
          xfer += iprot->readString(this->content);
          this->__isset.content = true;
        } else {
          xfer += iprot->skip(ftype);
        }
        break;
      default:
        xfer += iprot->skip(ftype);
        break;
    }
    xfer += iprot->readFieldEnd();
  }

  xfer += iprot->readStructEnd();

  return xfer;
}

uint32_t AntiSpamRequest::write(::apache::thrift::protocol::TProtocol* oprot) const {
  uint32_t xfer = 0;
  oprot->incrementRecursionDepth();
  xfer += oprot->writeStructBegin("AntiSpamRequest");

  xfer += oprot->writeFieldBegin("content", ::apache::thrift::protocol::T_STRING, 1);
  xfer += oprot->writeString(this->content);
  xfer += oprot->writeFieldEnd();

  xfer += oprot->writeFieldStop();
  xfer += oprot->writeStructEnd();
  oprot->decrementRecursionDepth();
  return xfer;
}

void swap(AntiSpamRequest &a, AntiSpamRequest &b) {
  using ::std::swap;
  swap(a.content, b.content);
  swap(a.__isset, b.__isset);
}

AntiSpamRequest::AntiSpamRequest(const AntiSpamRequest& other0) {
  content = other0.content;
  __isset = other0.__isset;
}
AntiSpamRequest& AntiSpamRequest::operator=(const AntiSpamRequest& other1) {
  content = other1.content;
  __isset = other1.__isset;
  return *this;
}
std::ostream& operator<<(std::ostream& out, const AntiSpamRequest& obj) {
  using apache::thrift::to_string;
  out << "AntiSpamRequest(";
  out << "content=" << to_string(obj.content);
  out << ")";
  return out;
}


AntiSpamResponse::~AntiSpamResponse() throw() {
}


void AntiSpamResponse::__set_is_spam(const int32_t val) {
  this->is_spam = val;
}

const char* AntiSpamResponse::ascii_fingerprint = "E86CACEB22240450EDCBEFC3A83970E4";
const uint8_t AntiSpamResponse::binary_fingerprint[16] = {0xE8,0x6C,0xAC,0xEB,0x22,0x24,0x04,0x50,0xED,0xCB,0xEF,0xC3,0xA8,0x39,0x70,0xE4};

uint32_t AntiSpamResponse::read(::apache::thrift::protocol::TProtocol* iprot) {

  uint32_t xfer = 0;
  std::string fname;
  ::apache::thrift::protocol::TType ftype;
  int16_t fid;

  xfer += iprot->readStructBegin(fname);

  using ::apache::thrift::protocol::TProtocolException;


  while (true)
  {
    xfer += iprot->readFieldBegin(fname, ftype, fid);
    if (ftype == ::apache::thrift::protocol::T_STOP) {
      break;
    }
    switch (fid)
    {
      case 1:
        if (ftype == ::apache::thrift::protocol::T_I32) {
          xfer += iprot->readI32(this->is_spam);
          this->__isset.is_spam = true;
        } else {
          xfer += iprot->skip(ftype);
        }
        break;
      default:
        xfer += iprot->skip(ftype);
        break;
    }
    xfer += iprot->readFieldEnd();
  }

  xfer += iprot->readStructEnd();

  return xfer;
}

uint32_t AntiSpamResponse::write(::apache::thrift::protocol::TProtocol* oprot) const {
  uint32_t xfer = 0;
  oprot->incrementRecursionDepth();
  xfer += oprot->writeStructBegin("AntiSpamResponse");

  xfer += oprot->writeFieldBegin("is_spam", ::apache::thrift::protocol::T_I32, 1);
  xfer += oprot->writeI32(this->is_spam);
  xfer += oprot->writeFieldEnd();

  xfer += oprot->writeFieldStop();
  xfer += oprot->writeStructEnd();
  oprot->decrementRecursionDepth();
  return xfer;
}

void swap(AntiSpamResponse &a, AntiSpamResponse &b) {
  using ::std::swap;
  swap(a.is_spam, b.is_spam);
  swap(a.__isset, b.__isset);
}

AntiSpamResponse::AntiSpamResponse(const AntiSpamResponse& other2) {
  is_spam = other2.is_spam;
  __isset = other2.__isset;
}
AntiSpamResponse& AntiSpamResponse::operator=(const AntiSpamResponse& other3) {
  is_spam = other3.is_spam;
  __isset = other3.__isset;
  return *this;
}
std::ostream& operator<<(std::ostream& out, const AntiSpamResponse& obj) {
  using apache::thrift::to_string;
  out << "AntiSpamResponse(";
  out << "is_spam=" << to_string(obj.is_spam);
  out << ")";
  return out;
}

} // namespace