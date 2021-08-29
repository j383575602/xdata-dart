
#Homepage:
 
 XData is a simple serialize framework based on binary data, it is swift, small, safe and stable. Enable you to transfer data among java, javascript, ios and flutter.
 You can edit your contract classes and learn more on the page: [http://www.xcore.top](http://www.xcore.top), and all api calls of this website are using XData as the sample.
 So, if you are using ,or considering using JSON ,XML, or ProtocolBuffer, We recommend you have a try on XData as an alternative.

# xdata-dart
This is the xdata repo for dart platform. If you want to download all platforms,there they are:

-  xdata-all: a repo managed all platforms by google repo tool.

    git@github.com:j383575602/xdata-all.git

-  xdata-java : java platform

    git@github.com:j383575602/xdata-java.git

-  xdata-objective-c : objective-c platform

    git@github.com:j383575602/xdata-objective-c.git

- xdata-javascript : javascript platform

    git@github.com:j383575602/xdata-javascript.git

-  xdata-dart : dart platform

    git@github.com:j383575602/xdata-dart.git


# Demo
    Assume there are two classes defined with XData protocol.  User, Car

    var car1 = XCarWrapper();
    car1.brand = "Audi";

    var car2 = XCarWrapper();
    car2.brand = "Porsche";

    var cars =  List<XCarWrapper>();
    cars.add(car1);
    carr.add(car2);


    var user = XUserWrapper();
    user.name = "John Smith";
    user.age = 35;
    user.cars = cars;


    //start to serialize
    var writer = new XDataWriter();
    var bytes = writer.write(user);


    //start to deserialize
    var parser = XDataParser();

    var data = parser.parse(bytes);

    var user2 = XUserWrapper(data);
    
    //start to check 
    assert(user2.name = "John Smith"));
    assert(user2.age  == 35);
    assert(user2.cars.length == 2);
    assert(user2.cars[0].brand == "Audi");
    assert(user2.cars[1].brand == "Porsche");


# Supprted Types


 |order|datatype |  single |List      | Set   | StringMap|IntMap | LongMap | FloatMap |DoubleMap |
   |-----|-----|---------| ---------|--------|----------|-------|---------|----------|----------|
   |1|int8|int|List\<int>| Set\<int> |Map<String,int>|Map<int,int>| Map<int,int>|Map<double,int>|Map<double,int>|
   |2|int16|int|List\<int>| Set\<int> |Map<String,int>|Map<int,int>| Map<int,int>|Map<double,int>|Map<double,int>|
   |3|int32|int|List\<int>|Set\<int>|Map<String,int>|Map<int,int>| Map<int,int>|Map<double,int>|Map<double,int>|
   |4|int64|int|List\<int>|Set\<int>|Map<String,int>|Map<int,int>| Map<int,int>|Map<double,int>|Map<double,int>|
   |5|float32|double|List\<double>|Set\<double>|Map<String,double>|Map<int,double>| Map<int,double>|Map<double,double>|Map<double,double>|
   |6|float64|double|List\<double>|Set\<double>|Map<String,double>|Map<int,double>| Map<int,double>|Map<double,double>|Map<double,double>|
   |7|bool|bool|List\<bool>|Set\<bool>|Map<String,bool>|Map<int,bool>| Map<int,bool>|Map<double,bool>|Map<double,bool>
   |8|String|String|List\<String>|Set\<String>|Map<String,String>|Map<int,String>| Map<int,String>|Map<double,String>|Map<double,String>|
   |9|DateTime|DateTime|List\<DateTime>|Set\<DateTime>|Map<String,DateTime>|Map<int,DateTime>| Map<int,DateTime>|Map<double,DateTime>|Map<double,DateTime>|
   |10|Int8List|Int8List|List\<Int8List>|Set\<Int8List>|Map<String,Int8List>|Map<int,Int8List>| Map<int,Int8List>|Map<double,Int8List>|Map<double,Int8List>|
   |11|XData|XData|List\<XData>|Set\<XData>|Map<String,XData>|Map<int,XData>| Map<int,XData>|Map<double,XData>|Map<double,XData>|
