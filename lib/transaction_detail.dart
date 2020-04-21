import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilot/models/transaction.dart';

class TransactionDetail extends StatelessWidget {
  final Transaction transaction;

  TransactionDetail(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(transaction.title)),
      body:
          Container(padding: EdgeInsets.all(20), child: Text(transaction.desc)),
    );
  }
}
