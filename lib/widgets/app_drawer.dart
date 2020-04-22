import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          leading: Icon(FontAwesomeIcons.list),
          title: Text("Summary"),
        ),
        ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(title: Text("Add a new account"));
                });
          },
          leading: Icon(FontAwesomeIcons.edit),
          title: Text("Add Card / Account"),
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
    ));
  }
}
