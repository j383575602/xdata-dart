import 'package:xdata/xdata.dart';
import '../contract/com/test/TTAModleWrapper.dart';
import '../contract/com/test/TTBModelWrapper.dart';

void main() {
  print('This is a demo to use xdata!');
  int t0 = DateTime.now().millisecondsSinceEpoch;
  testAModel();
  testBModel();
  var t1 = DateTime.now().millisecondsSinceEpoch;

  print("use time:${(t1-t0)}");
}

void testAModel() {
  var amodel = createA();
  printAModel("amodel",amodel);
  var writer = XDataWriter();
  var bytes = writer.write(amodel);
  var parser = XDataParser();
  var xdata = parser.parse(bytes);
  var newModel = TTAModleWrapper.withData(xdata);
  printAModel("newModel", newModel);
}

void testBModel() {
  var bmodel = createB();
  printB("bmodel", bmodel);
  var writer = XDataWriter();
  var bytes = writer.write(bmodel);
  var parser = XDataParser();
  var xdata = parser.parse(bytes);
  var newModel = TTBModelWrapper.withData(xdata);
  printB("newModel", newModel);
}

TTAModleWrapper createA() {
  var amodel = TTAModleWrapper();
  amodel.singleString = "Single String";
  var names =  Map<double,String>();
  names[1234.324499]= "names item 1";
  names[124.342432]= "names item 2";
  amodel.names = names;

  var list = List<String>();
  list.add("list item 0");
  list.add("list item 1");

  amodel.stringList = list;

  var set = Set<String>();
  set.add("set item 0");
  set.add("set item 1");
  amodel.stringSet = set;

  var intmap = Map<int,String>();
  intmap[1] = "int map item 0";
  intmap[2] = "int map item 1";

  amodel.stringIntMap = intmap;

  var longmap = Map<int,String>();
  longmap[1898989098009] = "long map item 0";
  longmap[21898989098009] = "long map item 1";

  amodel.stringLongMap = longmap;

  var floatmap = Map<double,String>();
  floatmap[189889.098009] = "float map item 0";
  floatmap[21898989098.009] = "float map item 1";

  amodel.stringFloatMap = floatmap;

  var doublemap = Map<double,String>();
  doublemap[189889.09800999] = "double map item 0";
  doublemap[21898989098.08899809] = "double map item 1";

  amodel.stringDoubleMap = doublemap;
  return amodel;
}

void printAModel(String tip,TTAModleWrapper amodel) {
  print("=====================${tip}=====================");
  print("single string:${amodel.singleString}");
  amodel.stringList?.forEach((element) {print("string list item:$element");});
  amodel.stringSet?.forEach((element) {print("string set item:$element");});
  amodel.stringIntMap?.forEach((key, value) {print("int map item :$key => $value");});
  amodel.stringLongMap?.forEach((key, value) {print("long map item :$key => $value");});
  amodel.stringFloatMap?.forEach((key, value) {print("float map item :$key => $value");});
  amodel.stringDoubleMap?.forEach((key, value) {print("double map item :$key => $value");});

}

TTBModelWrapper createB() {
  var bmodel = TTBModelWrapper();
  bmodel.singleField = createA();
  var list = List<TTAModleWrapper>();
  list.add(createA());
  list.add(createA());
  bmodel.listField = list;

  var set = Set<TTAModleWrapper>();
  set.add(createA());
  set.add(createA());
  bmodel.setField = set;

  var stringmap = Map<String,TTAModleWrapper>();
  stringmap["key0"] = createA();
  stringmap["key1"] = createA();
  bmodel.stringMapField = stringmap;

  var intmap = Map<int,TTAModleWrapper>();
  intmap[1] = createA();
  intmap[2] = createA();
  bmodel.intMapField = intmap;

  var longmap = Map<int,TTAModleWrapper>();
  longmap[98934425354] = createA();
  longmap[788754325432] = createA();
  bmodel.longMapField = longmap;

  var floatmap = Map<double,TTAModleWrapper>();
  floatmap[8788.098] = createA();
  floatmap[7874.87] = createA();
  bmodel.floatMapField = floatmap;

  var doublemap = Map<double,TTAModleWrapper>();
  doublemap[988.87987876] = createA();
  doublemap[78897.98677] = createA();
  bmodel.doubleMapField = doublemap;
  return bmodel;
}

void printB(String tip,TTBModelWrapper bmodel) {
  print("=========================$tip====================");
  printAModel("bmodle.singleField", bmodel.singleField);
  bmodel.listField?.forEach((element) {printAModel("bmodel.listfield.item", element);});
  bmodel.setField?.forEach((element) {printAModel("bmodel.setField.item", element);});
  bmodel.stringMapField?.forEach((key,element) {printAModel("bmodel.stringmap.item.$key", element);});
  bmodel.intMapField?.forEach((key,element) {printAModel("bmodel.intmap.item.$key", element);});
  bmodel.longMapField?.forEach((key,element) {printAModel("bmodel.longmap.item.$key", element);});
  bmodel.floatMapField?.forEach((key,element) {printAModel("bmodel.floatmap.item.$key", element);});
  bmodel.doubleMapField?.forEach((key,element) {printAModel("bmodel.doublemap.item.$key", element);});
}
