/**
a model */
import 'package:xdata/xdata.dart';

class TTAModleWrapper extends XDataWrapper { 
    TTAModleWrapper.withData(XData xdata) : super.withData(xdata);
    TTAModleWrapper():this.withType(9928704);
    TTAModleWrapper.withType(int type) : super.withType(type);
        /**
     *<br>说明：Strings
     *<br>索引：30721
     *<br>类型：Map<Double,String>
     *@since (1)
     */
    set names (Map<double,String> names) {
       super.set(30721,names);
    }

    Map<double,String> get names {
       return super.getDataMap(30721).cast<double,String>();
    }
    set stringList (List<String> stringList) {
       super.set(6146,stringList);
    }

    List<String> get stringList {
       return super.getDataList(6146).cast<String>();
    }
    set stringSet (Set<String> stringSet) {
       super.set(10243,stringSet);
    }

    Set<String> get stringSet {
       return super.getDataSet(10243).cast<String>();
    }
    set stringIntMap (Map<int,String> stringIntMap) {
       super.set(14340,stringIntMap);
    }

    Map<int,String> get stringIntMap {
       return super.getDataMap(14340).cast<int,String>();
    }
    set stringLongMap (Map<int,String> stringLongMap) {
       super.set(22533,stringLongMap);
    }

    Map<int,String> get stringLongMap {
       return super.getDataMap(22533).cast<int,String>();
    }
    /**
     *<br>说明：float-string map
     *<br>索引：26630
     *<br>类型：Map<Float,String>
     *@since (1)
     */
    set stringFloatMap (Map<double,String> stringFloatMap) {
       super.set(26630,stringFloatMap);
    }

    Map<double,String> get stringFloatMap {
       return super.getDataMap(26630).cast<double,String>();
    }
    /**
     *<br>说明：double-string map
     *<br>索引：30727
     *<br>类型：Map<Double,String>
     *@since (1)
     */
    set stringDoubleMap (Map<double,String> stringDoubleMap) {
       super.set(30727,stringDoubleMap);
    }

    Map<double,String> get stringDoubleMap {
       return super.getDataMap(30727).cast<double,String>();
    }
    /**
     *<br>说明：single string value
     *<br>索引：2056
     *<br>类型：String
     *@since (1)
     */
    String get singleString {
        return super.get(2056);
    }
    set singleString(String singleString) {
        super.set(2056,singleString);
    }
}