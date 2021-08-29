import 'XDataWrapper.dart';
import 'X_Data.dart';
class StringMapObjectHolder<T extends XDataWrapper> {
  int _fieldIndex;
  Function(XData data) _converter;
  Map<String,T> _cache;
  XDataWrapper _source;
  StringMapObjectHolder(this._source,this._fieldIndex,this._converter);
  Map<String,T> get() {
    if (_cache != null) {
      return _cache;
    }
    var map = _source.getDataMap(_fieldIndex);
    var result = Map<String,T>();
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
  void set(Map<String,T> obj) {
    _cache = obj;
    _source.set(_fieldIndex,obj);
  }
}