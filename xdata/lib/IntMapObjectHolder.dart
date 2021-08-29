import 'XDataWrapper.dart';
import 'X_Data.dart';
class IntMapObjectHolder<T extends XDataWrapper> {
  int _fieldIndex;
  Function(XData data) _converter;
  Map<int,T> _cache;
  XDataWrapper _source;
  IntMapObjectHolder(this._source,this._fieldIndex,this._converter);
  Map<Object,T> get() {
    if (_cache != null) {
      return _cache;
    }
    var map = _source.getDataMap(_fieldIndex);
    var result = Map<int,T>();
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
  void set(Map<int,T> obj) {
    _cache = obj;
    _source.set(_fieldIndex,obj);
  }
}