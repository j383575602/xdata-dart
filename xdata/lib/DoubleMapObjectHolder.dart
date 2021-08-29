import 'dart:ffi';

import 'XDataWrapper.dart';
import 'X_Data.dart';
class DoubleMapObjectHolder<T extends XDataWrapper> {
  int _fieldIndex;
  Function(XData data) _converter;
  Map<double,T> _cache;
  XDataWrapper _source;
  DoubleMapObjectHolder(this._source,this._fieldIndex,this._converter);
  Map<double,T> get() {
    if (_cache != null) {
      return _cache;
    }
    var map = _source.getDataMap(_fieldIndex);
    var result = Map<double,T>();
    if (map == null) {
      return result;
    }
    map?.forEach((key, value) {
      if (value is XDataWrapper) {
        result[key] = value;
      } else {
        Object wrapper = _converter.call(value);
        result[key] = wrapper;
      }
    });
    _cache = result;
    return result;
  }
  void set(Map<double,T> obj) {
    _cache = obj;
    _source.set(_fieldIndex,obj);
  }
}