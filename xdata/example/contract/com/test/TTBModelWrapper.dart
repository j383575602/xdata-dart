/**
BModel */
import 'package:xdata/xdata.dart';
import './TTAModleWrapper.dart';

class TTBModelWrapper extends XDataWrapper { 
    TTBModelWrapper.withData(XData xdata) : super.withData(xdata);
    TTBModelWrapper():this.withType(9961472);
    TTBModelWrapper.withType(int type) : super.withType(type);
        ObjectHolder<TTAModleWrapper> _singleFieldHolder;
    ListObjectHolder<TTAModleWrapper> _listFieldHolder;
    SetObjectHolder<TTAModleWrapper> _setFieldHolder;
    StringMapObjectHolder<TTAModleWrapper> _stringMapFieldHolder;
    IntMapObjectHolder<TTAModleWrapper> _intMapFieldHolder;
    IntMapObjectHolder<TTAModleWrapper> _longMapFieldHolder;
    DoubleMapObjectHolder<TTAModleWrapper> _floatMapFieldHolder;
    DoubleMapObjectHolder<TTAModleWrapper> _doubleMapFieldHolder;
    void initFieldValueHolder() {
        super.initFieldValueHolder();
        _singleFieldHolder = ObjectHolder(this,9928705,(XData xdata) => TTAModleWrapper.withData(xdata));
        _listFieldHolder = ListObjectHolder(this,9932802,(XData xdata) => TTAModleWrapper.withData(xdata));
        _setFieldHolder = SetObjectHolder(this,9936899,(XData xdata) => TTAModleWrapper.withData(xdata));
        _stringMapFieldHolder = StringMapObjectHolder(this,9945092,(XData xdata) => TTAModleWrapper.withData(xdata));
        _intMapFieldHolder = IntMapObjectHolder(this,9940997,(XData xdata) => TTAModleWrapper.withData(xdata));
        _longMapFieldHolder = IntMapObjectHolder(this,9949190,(XData xdata) => TTAModleWrapper.withData(xdata));
        _floatMapFieldHolder = DoubleMapObjectHolder(this,9953287,(XData xdata) => TTAModleWrapper.withData(xdata));
        _doubleMapFieldHolder = DoubleMapObjectHolder(this,9957384,(XData xdata) => TTAModleWrapper.withData(xdata));
        }
    /**
     *<br>说明：single model field
     *<br>索引：9928705
     *<br>类型：TTAModleWrapper
     *@since (1)
     */
    TTAModleWrapper get singleField {
        return _singleFieldHolder.get();
    }
    set singleField(TTAModleWrapper singleField) {
        _singleFieldHolder.set(singleField);
    }
    /**
     *<br>说明：list model field
     *<br>索引：9932802
     *<br>类型：List of TTAModleWrapper
     *@since (1)
     */
    set listField (List<TTAModleWrapper> listField) {
       _listFieldHolder.set(listField);
    }

    List<TTAModleWrapper> get listField {
       return _listFieldHolder.get();
    }
    /**
     *<br>说明：set model field
     *<br>索引：9936899
     *<br>类型：Set of TTAModleWrapper
     *@since (1)
     */
    set setField (Set<TTAModleWrapper> setField) {
                 _setFieldHolder.set(setField);
    }

    Set<TTAModleWrapper> get setField {
      return _setFieldHolder.get();
    }
    /**
     *<br>说明：string map field
     *<br>索引：9945092
     *<br>类型：Map<String,TTAModleWrapper>
     *@since (1)
     */
   set stringMapField (Map<String,TTAModleWrapper> stringMapField) {
       _stringMapFieldHolder.set(stringMapField);
   }

   Map<String,TTAModleWrapper> get stringMapField {
       return _stringMapFieldHolder.get();
   }
    /**
     *<br>说明：int map
     *<br>索引：9940997
     *<br>类型：Map<Integer,TTAModleWrapper>
     *@since (1)
     */
    set intMapField (Map<int,TTAModleWrapper> intMapField) {
       _intMapFieldHolder.set(intMapField);
    }

    Map<int,TTAModleWrapper> get intMapField {
       return _intMapFieldHolder.get();
    }
    /**
     *<br>说明：long map
     *<br>索引：9949190
     *<br>类型：Map<Long,TTAModleWrapper>
     *@since (1)
     */
    set longMapField (Map<int,TTAModleWrapper> longMapField) {
       _longMapFieldHolder.set(longMapField);
    }

    Map<int,TTAModleWrapper> get longMapField {
       return _longMapFieldHolder.get();
    }
    /**
     *<br>说明：float map
     *<br>索引：9953287
     *<br>类型：Map<Float,TTAModleWrapper>
     *@since (1)
     */
    set floatMapField (Map<double,TTAModleWrapper> floatMapField) {
       _floatMapFieldHolder.set(floatMapField);
    }

    Map<double,TTAModleWrapper> get floatMapField {
       return _floatMapFieldHolder.get();
    }
    /**
     *<br>说明：double map
     *<br>索引：9957384
     *<br>类型：Map<Double,TTAModleWrapper>
     *@since (1)
     */
    set doubleMapField (Map<double,TTAModleWrapper> doubleMapField) {
       _doubleMapFieldHolder.set(doubleMapField);
    }

    Map<double,TTAModleWrapper> get doubleMapField {
       return _doubleMapFieldHolder.get();
    }
}