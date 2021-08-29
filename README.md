
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

    XCarWrapper car1 = new XCarWrapper();
    car1.setBrand("Audi");

    XCarWrapper car2 = new XCarWrapper();
    car2.setBrand("Porsche");

    List<XCarWrapper> cars = new ArrayList<>();
    cars.add(car1);
    carr.add(car2);


    XUserWrapper user = new XUserWrapper();
    user.setName("John Smith");
    user.setAge(35);
    user.setCars(cars);


    //start to serialize
    XDataWriter writer = new XDataWriter();
    byte[] bytes = writer.writeData(user);


    //start to deserialize
    XDataParser parser = new XDataParser();

    XData data = parser.parse(bytes);

    XUserWrapper user2 = new XUserWrapper(data);
    
    //start to check 
    assert(user2.getName().equals("John Smith"));
    assert(user2.getAge() == 35);
    assert(user2.getCars().size() == 2);
    assert(user2.getCars().get(0).getBrand().equals("Audi"));
    assert(user2.getCars().get(1).getBrand().equals("Porsche"));


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
