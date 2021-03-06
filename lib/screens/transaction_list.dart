import 'package:flutter/material.dart';
import 'package:pilot/widgets/app_drawer.dart';
import 'package:pilot/widgets/compose_button.dart';
import 'package:pilot/models/transaction.dart';
import 'package:pilot/screens/transaction_detail.dart';

class TransactionList extends StatefulWidget {
  final String title;
  const TransactionList({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Future<List<Transaction>> transactions;

  void initState() {
    super.initState();
    transactions = Transaction.getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                var _transactions = Transaction.getTransactions();
                setState(() {
                  transactions = _transactions;
                });
              })
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: transactions,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text("There was an error: ${snapshot.error}");
              }
              var transactions = snapshot.data;
              return ListView.separated(
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TransactionDetail(transaction)));
                    },
                  );
                },
              );
          }
        },
      ),
      floatingActionButton: ComposeButton(),
    );
  }
}
