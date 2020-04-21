import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilot/Transaction.dart';
import 'package:pilot/TransactionNew.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Increment',
      child: Icon(Icons.add),
      onPressed: () async {
        Transaction transaction = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => TransactionNew()));
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(transaction.title),
        ));
      },
    );
  }
}
