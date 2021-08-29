
import 'X_Data.dart';
class XDataWrapper extends XData {
    XData data;
    XDataWrapper.withData(this.data):super(data.type) {
        initFieldValueHolder();
    }
    XDataWrapper.withType(int type):super(type){
        initFieldValueHolder();
    }

    void initFieldValueHolder() {

    }
    Object get (int index) {
        if (data != null) {
            return data.get(index);
        }
        return super.get(index);
    }

    List<T> getDataList<T> (int index) {
        List list = null;
        if (data != null) {
            list = data.get(index);
        } else {
            list = super.get(index);;
        }
        return list.cast<T>();
    }

    Set<T> getDataSet<T> (int index) {
        Set set = null;
        if (data != null) {
            set = data.get(index);
        } else {
            set = super.get(index);;
        }
        return set.cast<T>();
    }

    Map getDataMap (int index) {
        Map map = null;
        if (data != null) {
            map = data.get(index);
        } else {
            map = super.get(index);;
        }
        return map;
    }

    void set(int index, Object value) {
        if (data != null) {
            return data.set(index, value);
        }
        return super.set(index, value);
    }

    get type {
        return data == null ? super.type : data.type;
    }
}