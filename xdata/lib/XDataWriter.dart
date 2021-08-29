import 'dart:convert';
import 'dart:typed_data';
import 'X_Data.dart';
import 'XDataWrapper.dart';
import 'LinkedBuffer.dart';
import 'XType.dart';

class XDataWriter {
  bool debug = true;
  int infoSize = 0;
  LinkedBuffer buffer = null;
  XDataWriter.bufferSize(size) {
    buffer = LinkedBuffer(size);
  }
  XDataWriter() : this.bufferSize(4096);

  Int8List write(XData data) {
    var t0 = DateTime.now().millisecondsSinceEpoch;
    this._writeData(data);
    var t1 = DateTime.now().millisecondsSinceEpoch;
    if (this.debug) {
      print("write use:" + (t1 - t0).toString());
    }
    return this._commit();
  }

  void _writeData(XData data) {
    XData toWrite = data;
    if (toWrite is XDataWrapper) {
      XDataWrapper xDataWrapper = toWrite as XDataWrapper;
      if (xDataWrapper.data != null) {
        toWrite = xDataWrapper.data;
      }
    }
    _doWriteData(toWrite);
  }

  void _writeDataWithoutType(XData data) {
    XData toWrite = data;
    if (toWrite is XDataWrapper) {
      XDataWrapper xDataWrapper = toWrite as XDataWrapper;
      if (xDataWrapper.data != null) {
        toWrite = xDataWrapper.data;
      }
    }
    _doWriteDataWithoutType(toWrite);
  }

  void _doWriteData(XData xData) {
    _writeType(xData);
    _doWriteDataWithoutType(xData);
  }


  void _doWriteDataWithoutType(XData xData) {
    _writeFieldCount(xData);
    _writeFieldValue(xData);
  }

  Int8List _commit() {
    return buffer.toBytes();
  }

  void _writeType(XData data) {
    _writeByte4I(data.type);
  }

  void _writeFieldCount(XData xData) {
    _writeByte(xData.fields.length);
  }

  void _writeFieldValue(XData xData) {
    xData.fields.forEach((key, value) {
      int type = key;
      Object rawValue = value;
      _writeByte4I(type);
      infoSize += 4;
      /**
       * 是否是列表
       */
      int collectionFlag = type & XType.MASK_TYPE_COLLECTION;
      /**
       * 原始类型
       */
      int rawType = type & XType.MASK_TYPE & ~XType.MASK_TYPE_COLLECTION;
      if (collectionFlag == XType.MASK_TYPE_COLLECTION_LIST) {
        List list = rawValue as List;
        _writeList(list, rawType);
      } else if (collectionFlag == XType.MASK_TYPE_COLLECTION_SET) {
        _writeSet(rawValue as Set, rawType);
      } else if (collectionFlag == XType.MASK_TYPE_COLLECTION_STRING_MAP
                ||collectionFlag == XType.MASK_TYPE_COLLECTION_INT_MAP
                ||collectionFlag == XType.MASK_TYPE_COLLECTION_LONG_MAP
                ||collectionFlag == XType.MASK_TYPE_COLLECTION_FLOAT_MAP
                ||collectionFlag == XType.MASK_TYPE_COLLECTION_DOUBLE_MAP

      ){
        _writeMap(rawValue as Map, rawType, collectionFlag);
      } else if (collectionFlag == 0) {
        _writeSingleObject(rawValue, rawType);
      } else {
        throw Exception("collectionFlag is error $collectionFlag");
      }
    });
  }

  void _writeList(List values, int rawType) {
    int len = values.length;
    _writeByte4I(len);
    infoSize += 4;
    for (Object rawValue in values) {
      _writeSingleObject(rawValue, rawType);
    }
  }

  void _writeSet(Set values, int rawType) {
    int len = values.length;
    _writeByte4I(len);
    infoSize += 4;
    for (Object rawValue in values) {
      _writeSingleObject(rawValue, rawType);
    }
  }

  void _writeMap(Map values, int rawType,int mapFlag) {
    int len = values.length;
    _writeByte4I(len);
    infoSize += 4;
    values.forEach((key, value) {
      if (mapFlag == XType.MASK_TYPE_COLLECTION_STRING_MAP) {
        _writeStringField(key);
      } else if (mapFlag == XType.MASK_TYPE_COLLECTION_INT_MAP) {
        _writeByte4I(key);
      } else if (mapFlag == XType.MASK_TYPE_COLLECTION_LONG_MAP) {
        _writeByte8F(key.toDouble());
      } else if (mapFlag == XType.MASK_TYPE_COLLECTION_FLOAT_MAP) {
        _writeByte4F(key);
      } else if (mapFlag == XType.MASK_TYPE_COLLECTION_DOUBLE_MAP) {
        _writeByte8F(key);
      }
      _writeSingleObject(value, rawType);
    });
  }

  void _writeSingleObject(Object rawValue, int rawType) {
    if (rawType == XType.TYPE_BYTE_i_1) {
      int value = rawValue as int;
      _writeByte(value);
    } else if (rawType == XType.TYPE_BYTE_i_2) {
      int value = rawValue as int;
      _writeByte2(value);
    } else if (rawType == XType.TYPE_BYTE_i_4) {
      int value = rawValue as int;
      _writeByte4I(value);
    } else if (rawType == XType.TYPE_BYTE_i_8) {
      int intValue = rawValue as int;
      double value = intValue.toDouble();
      _writeByte8F(value);
    } else if (rawType == XType.TYPE_BYTE_f_4) {
      double value = rawValue as double;
      _writeByte4F(value);
    } else if (rawType == XType.TYPE_BYTE_f_8) {
      double value = rawValue as double;
      _writeByte8F(value);
    } else if (rawType == XType.TYPE_BLOB) {
      Int8List bytes = rawValue as Int8List;
      _writeBytes(bytes);
    } else if (rawType == XType.TYPE_DATE) {
      DateTime d = rawValue as DateTime;
      _writeByte8F(d.millisecondsSinceEpoch as double);
    } else if (rawType == XType.TYPE_BOOLEAN) {
      bool b = rawValue as bool;
      _writeBoolean(b);
    } else if (rawType == XType.TYPE_STRING) {
      String s = rawValue as String;
      _writeStringField(s);
    } else if (rawType >= XType.TYPE_OBJECT_START) {
      XData data = rawValue as XData;
      _writeDataWithoutType(data);
    } else {
      print("Note support type : $rawType");
    }
  }

  void _jump(int count) {
    buffer.jump(count);
  }

  void _seek(int position) {
    buffer.seek(position);
  }

  void _writeBoolean(bool b) {
    _writeByte(b ? 1 : 0);
  }

  void _writeByte(int b) {
    buffer.writeByte(b & 0xFF);
  }

  void _writeByte2(int s) {
    buffer.writeByte((s >> 8) & 0xFF);
    buffer.writeByte(s & 0xFF);
  }

  void _writeByte4I(int i) {
    for (int index = 3; index >= 0; index--) {
      buffer.writeByte(((i >> index * 8) & 0xFF));
    }
  }

  void _writeByte8I(int i) {
    for (int index = 7; index >= 0; index--) {
      buffer.writeByte(((i >> index * 8) & 0xFF));
    }
  }

  void _writeByte4F(double i) {
    var bytes = Int8List(4);
    var view = ByteData.view(bytes.buffer, 0, 4);
    view.setFloat32(0, i);
    _writeBytes(bytes);
  }

  void _writeBytes(Int8List bytes) {
    buffer.writeBytes(bytes);
  }

  void _writeByte8F(double i) {
    var bytes = Int8List(8);
    var view = ByteData.view(bytes.buffer, 0, 8);
    view.setFloat64(0, i);
    _writeBytes(bytes);
  }

  void _writeStringField(String rawValue) {
    var bytes = utf8.encode(rawValue);
    _writeByte4I(bytes.length);
    buffer.writeUBytes(bytes);
  }
}
