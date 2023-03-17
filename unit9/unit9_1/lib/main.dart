import 'package:flutter/material.dart';
import 'package:unit9_1/screen/form_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  return DefaultTabController(length: 2,
   child: Scaffold(appBar: AppBar(
    title: Text(widget.title),
  ),
  body: TabBarView(children: [FormScreen(),]),
  bottomNavigationBar: 
  TabBar(tabs: [Tab(text: 'Input temp.'),
  Tab(text: 'student list',)]
  ),
  backgroundColor: Colors.blue,
  ));
  }
}
