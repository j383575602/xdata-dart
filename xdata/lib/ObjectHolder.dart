import 'XDataWrapper.dart';
import 'X_Data.dart';
class ObjectHolder<T extends XDataWrapper> {
  int _fieldIndex;
  Function(XData data) _converter;
  T _cache;
  XDataWrapper _source;
  ObjectHolder(this._source,this._fieldIndex,this._converter);
  T get() {
    if (_cache != null) {
      return _cache;
    }
    var value = _source.get(_fieldIndex);
    if (value == null) {
      return null;
    }
    _cache = this._converter(value);
    return _cache;
  }
  void set(T obj) {
    _cache = obj;
    _source.set(_fieldIndex,obj);
  }
}