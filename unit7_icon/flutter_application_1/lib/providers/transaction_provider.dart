import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/database/transaction_db.dart';
import '../model/transaction.dart';


class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [
    ];
  List<Transactions> getTransaction() {
    return transactions;
  }
  void addTransaction(Transactions statement) async{
    var db = TransactionDB(dbName: "transaction.db");
    await db.insertData(statement);
    transactions = (await db.loadAllData()).cast<Transactions>();
    notifyListeners(); //alert update
  }
  void initData() async{
    var db = TransactionDB(dbName: "transaction.db");
    transactions = (await db.loadAllData()).cast<Transactions>();
    notifyListeners();
  }
}