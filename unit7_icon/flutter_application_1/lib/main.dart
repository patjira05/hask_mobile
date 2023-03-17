import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/favourites_page.dart';
import 'package:flutter_application_1/from_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'providers/transaction_provider.dart';
import 'model/transaction.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'แอปรายจ่าย'),
      debugShowCheckedModeBanner: false,
      ),
      
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
  int index =0;
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }
  @override
  Widget build(BuildContext context) {
  
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(children: [
          const HomeScreen(),
          FormScreen(),
        ]),
        bottomNavigationBar: TabBar(tabs: [
          Tab(
            icon: Icon(Icons.list),
            text: 'รายการ',
          ),
          Tab(
            icon: Icon(Icons.add),
            text: 'เพิ่มข้อมูล',
          )
        ]),
      ),
    );
  //consu
      //   child: Text('$index',
      //   style: const TextStyle(
      //     color: Colors.white,
      //     fontSize: 120,
      //     fontWeight: FontWeight.bold
      //   ),),
      // ),
      // // bottomNavigationBar: Theme(
      // //   data: Theme.of(context).copyWith(
      // //     iconTheme: const IconThemeData(color: Colors.orange),
      // //   ),
      // //   child: CurvedNavigationBar(
      // //     index: index,
      // //     height: 60.0,
      // //     items: const <Widget> [
      // //       Icon(Icons.home, size: 30,),
      // //       Icon(Icons.search, size: 30,),
      // //       Icon(Icons.favorite, size: 30,),
      // //       Icon(Icons.settings, size: 30,),
      // //       Icon(Icons.person, size: 30,),
      // //     ],
      // //     color: Colors.white,
      // //     buttonBackgroundColor: Colors.blue.shade200,
      // //     backgroundColor: Colors.transparent,
      // //     animationCurve: Curves.easeInOut,
      // //     animationDuration: const Duration(milliseconds: 600),
      // //     onTap: (index) {
      // //       setState(() {
      // //         this.index =index;
      // //       });
      // //     },
      // //     letIndexChange: (index) => true,
      //),
      
    
  }
}
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
        )
        ),
    );
  }
}
Widget buildHeader(BuildContext context) => Container(
  color: Colors.blue.shade700,
  padding: EdgeInsets.only(
    top: 24 + MediaQuery.of(context).padding.top,
  bottom: 24,
  ),
  child: Column(children: const [
    CircleAvatar(
      radius: 52,
      backgroundImage: NetworkImage(
        'https://th.bing.com/th/id/OIP.rVXCWoRvYdBTQbPup4DLMgHaGv?w=196&h=180&c=7&r=0&o=5&pid=1.7'
      ),
      ),
      SizedBox(height: 12),
      Text('flutter Dev',
      style: TextStyle(fontSize: 28, color: Colors.white)),
      Text('flutter@dev.com',
      style: TextStyle(fontSize: 16, color: Colors.white)),
    
  ],)
  

);
Widget buildMenuItems(BuildContext context) => Container(
  padding: const EdgeInsets.all(24),
  child: Wrap(runSpacing: 16,
  children: [
    ListTile(
      leading: const Icon(Icons.home_outlined),
      title: const Text('home'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
        const MyHomePage(title: 'home Page')));
      },
    ),
    ListTile(
      leading: const Icon(Icons.favorite_border),
      title: const Text('favourite'),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
        const FavouritesPage()));
      },
    ),
    ListTile(
      leading: const Icon(Icons.workspaces_outline),
      title: const Text('Workflow'),
      onTap: (){},
    ),
    ListTile(
      leading: const Icon(Icons.update),
      title: const Text('update'),
      onTap: (){},
    ),
    const Divider(color: Colors.black54, thickness: 1),
    ListTile(
      leading: const Icon(Icons.account_tree_outlined),
      title: const Text('Plugins'),
      onTap: (){},
    ),
    ListTile(
      leading: const Icon(Icons.notifications_outlined),
      title: const Text('notifications'),
      onTap: (){},
    )
  ],),
);