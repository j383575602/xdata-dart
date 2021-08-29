
import 'dart:ffi';

import 'X_Data.dart';
import 'XDataWrapper.dart';
import 'XBaseRecord.dart';
class XBaseRecordWrapper extends XDataWrapper {
  XBaseRecordWrapper.withData(XData data) : super.withData(data);
  XBaseRecordWrapper.withType(int type) : super.withType(type);
  XBaseRecordWrapper():super.withType(XBaseRecord.TYPE_INDEX);

  int get ID {
    return super.get(XBaseRecord.ID);
  }
  set ID(int id) {
    super.set(XBaseRecord.ID,id);
  }

  @Int8()
  int get STATUS {
    return super.get(XBaseRecord.STATUS);
  }


  set STATUS(@Int8() int status) {
    return super.set(XBaseRecord.STATUS,status);
  }

  @Int16()
  int get ADD_VERSION {
    return super.get(XBaseRecord.ADD_VERSION);
  }


  set ADD_VERSION(@Int16() int add_version) {
    return super.set(XBaseRecord.ADD_VERSION,add_version);
  }

  @Int16()
  int get VERSION {
    return super.get(XBaseRecord.VERSION);
  }

  set VERSION(@Int16() int version) {
    return super.set(XBaseRecord.VERSION,version);
  }




}