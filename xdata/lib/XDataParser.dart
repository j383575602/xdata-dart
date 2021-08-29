import 'dart:convert';
import 'dart:typed_data';
import 'X_Data.dart';
import 'XType.dart';
class XDataParser{
  Int8List data = null;
  ByteData dataView = null;
  bool debug = true;
  int position = 0;
  XData parse(Int8List data) {
    this.data = data;
    position = 0;
    this.dataView = ByteData.view(data.buffer,0,data.length);
    int t0 = DateTime.now().millisecondsSinceEpoch;
    XData x = _readData();
    int t1 = DateTime.now().millisecondsSinceEpoch;
    if (debug) {
      print("parse use:${(t1 - t0)}" );
    }
    return x;
  }

  XData _readData() {
    final int type = _readByte4I();//parseInt(typeBytes);
    return _readDataWithType(type);
  }

  XData _readDataWithType(int type) {
    XData result = XData(type);
    final int fieldCount = _readByte1I();
    for(int i=0;i<fieldCount;i++) {
      int index = _readByte4I();
      int collectionFlag = index & XType.MASK_TYPE_COLLECTION;
      int rawType = index & XType.MASK_TYPE & ~XType.MASK_TYPE_COLLECTION;
      if (collectionFlag == XType.MASK_TYPE_COLLECTION_LIST) {
        result.set(index,_readListObject(rawType));
      } else if (collectionFlag == XType.MASK_TYPE_COLLECTION_SET) {
        result.set(index,_readSetObject(rawType));
      } else if (collectionFlag == XType.MASK_TYPE_COLLECTION_STRING_MAP
                || collectionFlag == XType.MASK_TYPE_COLLECTION_INT_MAP
                || collectionFlag == XType.MASK_TYPE_COLLECTION_LONG_MAP
                || collectionFlag == XType.MASK_TYPE_COLLECTION_FLOAT_MAP
                || collectionFlag == XType.MASK_TYPE_COLLECTION_DOUBLE_MAP
      ) {
        result.set(index, _readMapObject(rawType, collectionFlag));
      } else if (collectionFlag == 0){
        result.set(index,_readSingleObject(rawType));
      } else {
        throw Exception("collection flag is error: $collectionFlag");
      }
    }
    return result;
  }

  Map _readMapObject (int rawType,int mapFlag) {
    var count = this._readByte4I();
    var map = Map();
    for (var j = 0; j < count; j++) {
      var key = null;
      if (mapFlag == XType.MASK_TYPE_COLLECTION_STRING_MAP) {
        key = _readStringField();
      } else if (mapFlag == XType.MASK_TYPE_COLLECTION_INT_MAP) {
        key = _readByte4I();
      } else if (mapFlag == XType.MASK_TYPE_COLLECTION_LONG_MAP) {
        key = _readByte8F().toInt();
      } else if (mapFlag == XType.MASK_TYPE_COLLECTION_FLOAT_MAP) {
        key = _readByte4F();
      } else if (mapFlag == XType.MASK_TYPE_COLLECTION_DOUBLE_MAP) {
        key = _readByte8F();
      }
      var value = this._readSingleObject(rawType);
      map[key] = value;
    }
    return map;
  }

  Set _readSetObject (int rawType) {
    var count = this._readByte4I();
    var set = Set();
    for (var j = 0; j < count; j++) {
      var value = this._readSingleObject(rawType);
      set.add(value);
    }
    return set;
  }


  List _readListObject (int rawType) {
    var count = this._readByte4I();
    var array = List(count);
    for (var j = 0; j < count; j++) {
      var value = this._readSingleObject(rawType);
      array[j] = value;
    }
    return array;
  }

  Object _readSingleObject(int rawType) {
    if (rawType == XType.TYPE_BYTE_i_1) {
      return this._readByte1I();
    } else if (rawType == XType.TYPE_BYTE_i_2) {
      return this._readByte2I();
    } else if (rawType == XType.TYPE_BYTE_i_4) {
      return this._readByte4I();
    } else if (rawType == XType.TYPE_BYTE_i_8) {
      return this._readByte8I();
    } else if (rawType == XType.TYPE_BYTE_f_4) {
      return this._readByte4F();
    } else if (rawType == XType.TYPE_BYTE_f_8) {
      return this._readByte8F();
    } else if (rawType == XType.TYPE_STRING) {
      return _readStringField();
    } else if (rawType == XType.TYPE_BOOLEAN) {
      var b = this._readByte1I();
      return  b == 1;
    } else if (rawType == XType.TYPE_BLOB) {
      var len = this._readByte4I();
      return this._readBytes(len);
    } else if (rawType == XType.TYPE_DATE) {
      var num = this._readByte8I();
      var d = DateTime.fromMicrosecondsSinceEpoch(num);
      return d;
    } if(rawType >=XType.TYPE_OBJECT_START) {
      return this._readDataWithType(rawType);
    }
    return null;
  }

  String _readStringField() {
    var len = this._readByte4I();
    return this._readString(len);
  }

  int _readByte1I() {
    var byte = this.dataView.getInt8(this.position);
    this.position++;
    return byte;
  }

  int _readByte2I() {
    var i = this.dataView.getInt16(this.position);
    this.position+= 2;
    return i;
  }
  int _readByte4I() {
    var i = this.dataView.getInt32(this.position);
    this.position+= 4;
    return i;
  }

  int _readByte8I() {
    double i1 = this.dataView.getFloat64(this.position);
    this.position+= 8;
    return i1.floor();
  }

  double _readByte4F () {
    var f = this.dataView.getFloat32(this.position);
    this.position+= 4;
    return f;
  }

  double _readByte8F() {
    var f = this.dataView.getFloat64(this.position);
    this.position+= 8;
    return f;
  }

  Int8List _readBytes(len) {
    var bytes = Int8List(len);
    var dataView = ByteData.view(bytes.buffer,0,len);
    for (var i=0;i<len;i++) {
      dataView.setInt8(i,this.dataView.getInt8(this.position));
      this.position ++;
    }
    return bytes;
  }

  Uint8List _readUBytes(len) {
    var bytes = Uint8List(len);
    var dataView = ByteData.view(bytes.buffer,0,len);
    for (var i=0;i<len;i++) {
      dataView.setInt8(i,this.dataView.getUint8(this.position));
      this.position ++;
    }
    return bytes;
  }

  String _readString (len) {
    Uint8List bytes = _readUBytes(len);
    var str = utf8.decode(bytes);
    return str;
  }
}
