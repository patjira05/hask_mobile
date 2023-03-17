import 'package:flutter/material.dart';
import 'package:flutter_application_1/cafe_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  const MyHomePage({super.key, required this.title});
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CafeMenu> menu = [
    CafeMenu('apple',50,'assets/images/menu1.jpg'),
    CafeMenu('orange',50,'assets/images/menu2.jpg'),
    CafeMenu('lemonate',50,'assets/images/menu3.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกเมนูเครื่องดื่ม patjira'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(30)
          ), height: 240,
          child: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (context, index) {
              CafeMenu drink = menu [index];
              return ListTile(
                leading: Image.asset(drink.img),
                title: Text(drink.name, style: TextStyle(fontSize: 30)),
                subtitle: Text('ราคา'+ drink.price.toString() + 'บาท',
                style: TextStyle(fontSize: 24)),
              );
            },
              ),
        ),
      ),
        
      );
    
  }
}
