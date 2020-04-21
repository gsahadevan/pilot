import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilot/Transaction.dart';

class TransactionNew extends StatefulWidget {
  @override
  _TransactionNewState createState() => _TransactionNewState();
}

class _TransactionNewState extends State<TransactionNew> {
  String title = '';
  String amount = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Enter a new Transaction")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: TextField(
                  onChanged: (value) {
                    title = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Divider(),
              ListTile(
                title: TextField(
                  onChanged: (value) {
                    amount = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Amount',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Divider(),
              ListTile(
                  title: TextField(
                onChanged: (value) {
                  description = value;
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                maxLines: 2,
              )),
              Divider(),
              ListTile(
                title: RaisedButton(
                  child: Text('Add'),
                  onPressed: () {
                    Transaction transaction =
                        Transaction(title, amount, "SG", description);
                    Navigator.pop(context, transaction);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
