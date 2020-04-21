import 'package:flutter/material.dart';
import 'package:pilot/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Color(0xff336699)),
      home: TransactionList(title: 'Expense Tracker'),
    );
  }
}
