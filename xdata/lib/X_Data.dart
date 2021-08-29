import 'dart:typed_data';

import 'XType.dart';

class XData {
  int type;
  XData(this.type);
  Map<int, Object> fields = Map();

  Object get (int index) {
    return fields[index];
  }
  void set(int index, Object value) {
    int collectionFlag = index & XType.MASK_TYPE_COLLECTION;
    if (collectionFlag == XType.MASK_TYPE_COLLECTION_LIST) {
      _setListField(index, value);
    } else if (collectionFlag == XType.MASK_TYPE_COLLECTION_SET) {
      _setSetField(index, value);
    } else if (collectionFlag == XType.MASK_TYPE_COLLECTION_STRING_MAP) {
      _setMapField(index,value);
    } else if (collectionFlag == XType.MASK_TYPE_COLLECTION_INT_MAP) {
      _setMapField(index,value);
    } else if (collectionFlag == XType.MASK_TYPE_COLLECTION_LONG_MAP) {
      _setMapField(index,value);
    } else if (collectionFlag == XType.MASK_TYPE_COLLECTION_FLOAT_MAP) {
      _setMapField(index,value);
    } else if (collectionFlag == XType.MASK_TYPE_COLLECTION_DOUBLE_MAP) {
      _setMapField(index,value);
    } else if (collectionFlag == 0) {
      _setSingleField(index, value);
    } else {
      throw Exception("collectionFlag is error: $collectionFlag");
    }
  }

  void _setSetField(int index,Set value) {
    if (value == null) {
      fields.remove(index);
      return;
    }
    if (value is Set) {
      if (value.isEmpty) {
        fields.remove(index);
      } else {
        fields[index] = value;
      }
      return;
    }
    throw new Exception("wrong value:$value for Set: for $type.$index");
  }

  void _setMapField(int index,Map value) {
    if (value == null) {
      fields.remove(index);
      return;
    }
    if (value is Map) {
      if (value.isEmpty) {
        fields.remove(index);
      } else {
        fields[index] = value;
      }
      return;
    }
    throw new Exception("wrong value:$value for Map: for $type.$index");
  }

  void _setListField(int index, List value) {
    if (value == null) {
      fields.remove(index);
      return;
    }
    if (value is List) {
      if (value.isEmpty) {
        fields.remove(index);
      } else {
        fields[index] = value;
      }
      return;
    }
    throw new Exception("wrong value:$value for list: for $type.$index");
  }

  void _setSingleField(int index, Object value) {
    int basicType = index & XType.MASK_TYPE & ~XType.MASK_TYPE_COLLECTION;
    if (basicType == XType.TYPE_BOOLEAN) {
      if (value == null) {
        fields.remove(index);
      } else {
        fields[index] = value;
      }
    } else if (basicType == XType.TYPE_BYTE_i_1
        || basicType == XType.TYPE_BYTE_i_2
        || basicType == XType.TYPE_BYTE_i_4
        || basicType == XType.TYPE_BYTE_i_8
        || basicType == XType.TYPE_BYTE_f_4
        || basicType == XType.TYPE_BYTE_f_8) {
      if (value == null) {
        fields.remove(index);
      } else if (!(value is num)) {
        throw Exception("wrong value:$value  for byte: for $type.$index");
      }
      if (value == 0) {
        fields.remove(index);
      } else {
        fields[index] = value;
      }
    } else if (basicType == XType.TYPE_STRING) {
      if (value == null) {
        fields.remove(index);
      } else if (!(value is String)) {
        throw Exception("wrong value:$value  for byte: for $type.$index");
      }
      //TODO handle empty string
      fields[index] = value;
    } else if (basicType == XType.TYPE_BLOB) {
      if (value == null) {
        fields.remove(index);
        return;
      }
      if (!(value is Int8List)) {
        throw new Exception(
            "wrong value:$value  for byte[] ,for $type .$index");
      }
      Int8List list = value as Int8List;
      if (list.length == 0) {
        fields.remove(index);
      } else {
        fields[index] = list;
      }
    } else if (basicType == XType.TYPE_DATE) {
      if (value == null) {
        fields.remove(index);
      } else if (!(value is DateTime)) {
        throw new Exception(
            "wrong value:$value  for Datetime ,for $type. $index");
      }
      fields[index] = value;
    } else if (basicType >= XType.TYPE_OBJECT_START) {
      if (value == null) {
        fields.remove(index);
      } else {
        if (value is XData) {
          fields[index] = value;
        } else {
          throw new Exception(
              "wrong value:$value  for XData ,for $type. $index");
        }
      }
    }
  }
}