import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pilot/Transaction.dart';

class TransactionList extends StatefulWidget  {
  final String title;
  const TransactionList({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState()  => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {

  var transactions = const [];

  Future loadTransactionList() async {
    String content = await rootBundle.loadString('data/transactions.json');
    List txns = json.decode(content);
    List<Transaction> _transactions = txns.map((json) => Transaction.fromJson(json)).toList();

    setState(() {
      transactions = _transactions;
    });
  }

  void initState() {
    loadTransactionList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: transactions.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          Transaction transaction = transactions[index];
          return ListTile(
            title: Text(transaction.title),
            trailing: Text(transaction.amount.toString()),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text(transaction.place),
            ),
            subtitle: Text(transaction.desc),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: ,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}