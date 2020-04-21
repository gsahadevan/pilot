import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pilot/TransactionNew.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TransactionNew()));
        },
    );
  }
}
