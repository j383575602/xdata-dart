import 'XDataWrapper.dart';
import 'X_Data.dart';
class SetObjectHolder<T extends XDataWrapper> {
  int _fieldIndex;
  Function(XData data) _converter;
  Set<T> _cache;
  XDataWrapper _source;
  SetObjectHolder(this._source,this._fieldIndex,this._converter);
  Set<T> get() {
    if (_cache != null) {
      return _cache;
    }
    var set = _source.getDataSet<XData>(_fieldIndex);
    var result = Set<T>();
    if (set == null) {
      return result;
    }
    set?.forEach((data) {
      if (data is XDataWrapper) {
        result.add(data);
      } else {
        Object wrapper = _converter.call(data);
        result.add(wrapper);
      }
    });
    _cache = result;
    return result;
  }
  void set(Set<T> obj) {
    _cache = obj;
    _source.set(_fieldIndex,obj);
  }
}