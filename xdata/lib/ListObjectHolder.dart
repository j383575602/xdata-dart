import 'XDataWrapper.dart';
import 'X_Data.dart';
class ListObjectHolder<T extends XDataWrapper> {
  int _fieldIndex;
  Function(XData data) _converter;
  List<T> _cache;
  XDataWrapper _source;
  ListObjectHolder(this._source,this._fieldIndex,this._converter);
  List<T> get() {
    if (_cache != null) {
      return _cache;
    }
    var list = _source.getDataList<XData>(_fieldIndex);
    var result = List<T>();
    if (list == null) {
      return result;
    }
    list?.forEach((data) {
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
  void set(List<T> obj) {
    _cache = obj;
    _source.set(_fieldIndex,obj);
  }
}