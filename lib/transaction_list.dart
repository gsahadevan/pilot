import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pilot/app_drawer.dart';
import 'package:pilot/compose_button.dart';
import 'package:pilot/models/transaction.dart';
import 'package:pilot/transaction_detail.dart';

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
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("gsahadevan@outlook.com"),
            accountName: Text("Gauthaman Sahadevan"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatars1.githubusercontent.com/u/37937909?s=460&u=f77fd1af1722ae112efe655cc093ac7d4599bbfb&v=4"),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text("Summary"),
          ),
          ListTile(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text("Add a new account / card information"));
                  });
            },
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text("Add Card / Account Information"),
            trailing: Chip(
              label: Text("3"),
              labelStyle: TextStyle(color: Color(0xffffffff)),
              backgroundColor: Color(0xff003366),
            ),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.cog),
                title: Text("Settings"),
              ),
            ),
          )
        ],
      )),
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
