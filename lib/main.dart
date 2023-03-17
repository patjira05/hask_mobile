import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title:"Hello",
  home:MyHomePage(),
  theme :ThemeData(primarySwatch: Colors.blue),
  );
  
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('AppBar'),),
  body: Center(child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('patjira',style: TextStyle(fontSize: 30,color: Colors.blue),),
        Image(width:200,image: NetworkImage('https://th.bing.com/th/id/OIP.Vx_yH2rrqHqCgFxG8kJchAHaEK?w=306&h=180&c=7&r=0&o=5&pid=1.7')),
        Image(width:200,image: NetworkImage('https://th.bing.com/th/id/OIP.E4GNxqrbXvoEk8UTv1Ze1wHaHa?w=177&h=180&c=7&r=0&o=5&pid=1.7')),
      ],
    ),
  )),
  );
  }
}