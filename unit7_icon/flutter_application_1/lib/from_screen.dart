

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/model/transaction.dart';
import 'package:flutter_application_1/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  //controller
  final titleController =TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              decoration: new InputDecoration(labelText: "ชื่อรายการ"),
              autofocus: true,
              controller: titleController,
              validator: (String? str) {
                if (str == '') return "กรุณาป้อนชื่อรายการ";
                return null;
              },
            ),
            TextFormField(
              decoration: new InputDecoration(labelText: "จำนวนเงิน"),
              keyboardType: TextInputType.number,
              controller: amountController,
              validator: (String? str) {
                if (str!.isEmpty) return "กรุณาป้อนจำนวนเงิน";
                  if (double.parse(str.toString()) <= 0)
                  return "กรุณาป้อนตัวเลขมากกว่า 0";
                return null;
              },
            ),
            TextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  var title = titleController.text;
                  var amount = amountController.text;
                  //print(title);
                  //print(amount);
                  //เตรียมข้อมูล
                  Transactions statement = Transactions(title: title
                  , amount: double.parse(amount),
                   date: DateTime.now());
                   //เรียก  provider
                   var provider = Provider.of<TransactionProvider>(context, listen: false);
                   provider.addTransaction(statement);
                   Navigator.pop(context);
                   Navigator.push(context, 
                   MaterialPageRoute(builder: (context) {
                    return MyHomePage(title: 'แอปรายจ่าย');
                   }));
                    
                }
                
              },
              child: Text("บันทึก"),
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
            ),
            
          ]),
        ),
      )
    );
  }
}