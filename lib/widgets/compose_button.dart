import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilot/models/transaction.dart';
import 'package:pilot/screens/transaction_new.dart';

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
        var text = transaction != null && transaction.title != null
            ? transaction.title
            : "Nothing?";
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(text),
        ));
      },
    );
  }
}
