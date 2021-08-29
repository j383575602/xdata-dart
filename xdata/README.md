## Usage：

 1  visit https://xcore.top to design a model .for example An UserModel(username,password). 
 
 2  download the source code and put in your source dir. you will get the source file UserModelWrapper.dart
    
### 1.serialize:

       
```      
        var user = UserModelWrapper();
        user.username = "Jim Green"
        user.password = "123456"
        var writer = XDataWriter();
        var bytes = writer.write(user);
```
        bytes is an Int8List,you can transform it anywhere now
        
       
        
### 2. deserialze:
        consider using the bytes above. assume you get from an api call.
        
```
        var parser = XDataParser();
        var xdata = parser.parse(bytes);
        var user = UserModelWrapper.withData(xdata);
        assert(user.username == "Jim Green")
        assert(user.password == "123456")
```
        
     
### 3. support datetypes:
   
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
  
  
 
            
        
        
        
        
    
    
    