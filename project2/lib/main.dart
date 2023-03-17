import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget { //stl
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.green)
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget { //stf
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number =0;//การสร้าง state
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('โปรแกรมนับเลข'),),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('กดปุ่มเพื่อเพิ่มจำนวนตัวเลข',style: TextStyle(fontSize: 24)),
              Text(
                number.toString(),
                style: TextStyle(fontSize: 60),
              ),//creat button
              TextButton(onPressed: () {}, child: Text("TextButton"),style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 20),backgroundColor: Colors.green,primary: Colors.white ),),
              ElevatedButton(onPressed: () {}, child: Text("ElevatedButton"), style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20),primary: Colors.yellow,onPrimary: Colors.red,),),
              OutlinedButton(onPressed: () {}, child: Text("OutlinedButton"), style: OutlinedButton.styleFrom(textStyle: TextStyle(fontSize: 20),primary: Colors.blue,side: BorderSide(color: Colors.grey)),),
              TextFormField(
                decoration: new InputDecoration(labelText: "Label"),
                autofocus: true,
                keyboardType: TextInputType.number
              
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: ((context,i) {
                  return ListTile(
      title: Text('เมนนูที่ ${i +1}',style: TextStyle(fontSize: 25)),
      subtitle: Text('หัวข้อย่อยที่ ${i +1}'));
                }),
                  //children: getData(10),
                ),
              )
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:  () {
            setState(() {
              number++;
            });
          }
          ,
          child: Icon(Icons.add)
          ,)
      );
    
  }
//   List<Widget> getData(int count){
//   List<Widget> data = [];
//   for (var i = 0 ; i< count; i++){
//     data.add(Text('เมนนูที่ ${i +1}',style: TextStyle(fontSize: 25),));
    
//   }
//   return data;
//  }         //crl+K+C is comment

  List<Widget> getData(int count){
  List<Widget> data = [];
  for (var i = 0 ; i< count; i++){
    var menu = ListTile(
      title: Text('เมนนูที่ ${i +1}',style: TextStyle(fontSize: 25)),
      subtitle: Text('หัวข้อย่อยที่ ${i +1}'));
    
    data.add(menu);
    
  }
  return data;
}

}


