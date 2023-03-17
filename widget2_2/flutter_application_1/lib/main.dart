import 'package:flutter/material.dart';
import 'package:flutter_application_1/MoneyBox.dart';

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
      home: const MyHomePage(title: 'My Account patjira'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [MoneyBox('ยอดคงเหลือ', 1000, Colors.blue, 150),SizedBox(height: 5,) 
          ,MoneyBox('รายรับ', 2000, Colors.green, 150),SizedBox(height: 5,)
          ,MoneyBox('รายจ่าย', 1000, Colors.red, 150),SizedBox(height: 5,)]
          
        ),
      ),
    );
  }
}
