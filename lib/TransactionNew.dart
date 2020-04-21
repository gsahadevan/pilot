import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter a new Transaction")),
      body: Center(child: Text("Enter a new Transactions"),)
    );
  }
}
