import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/favourites_page.dart';
import 'package:flutter_application_1/from_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'package:flutter_application_1/main.dart';
import '../providers/transaction_provider.dart';
import '../model/transaction.dart';
import '../database/transaction_db.dart';

//stf
class HomeScreen extends StatefulWidget {


  const HomeScreen({super.key});
  
  

  @override
  
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Colors.blueAccent,
    items: <Widget>[
      Icon(Icons.add, size: 30),
      Icon(Icons.list, size: 30),
      Icon(Icons.compare_arrows, size: 30),
    ],
    onTap: (index) {
      //Handle button tap
    },
  ),
      appBar: AppBar(
        title: Text("title"),
        backgroundColor: Colors.blue.shade700,
        actions: [
          IconButton(
            onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context){
              return FormScreen();
            }));
          },
          icon: Icon(Icons.add) ),
          IconButton(onPressed: () {
            SystemNavigator.pop();
          }, icon: Icon(Icons.exit_to_app, color: Colors.red,),)
        ],
      ),
      backgroundColor: Colors.greenAccent,
      drawer: const NavigationDrawer(),
      
       body: Consumer(
        builder: (context, TransactionProvider provider, child ){
          var count = provider.transactions.length;
          if (count <= 0) {
            return Center(
              child: Text( "ไม่พบข้อมูล",
              style: TextStyle(fontSize: 35),
              ),
            );
          }else
        return ListView.builder(
          itemCount: provider.transactions.length,
          itemBuilder: (context, int  index) {
            Transactions data = provider.transactions[index];
            return Card(elevation: 5,
        
        margin: const EdgeInsets.symmetric(vertical: 10,
        horizontal: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: FittedBox( child: Text(data.amount.toString()),
            ),

          ),
          title: Text(data.title),
          subtitle: Text(DateFormat("dd/MM/yyyy HH:mm:ss")
          .format(data.date)),
        ),
        );
        }
        );
        }
       )
       );
  }
}