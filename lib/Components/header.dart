import 'package:flutter/material.dart';
import 'package:isval_test/Components/menu.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  @override
  _HeaderState createState() => _HeaderState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HeaderState extends State<Header> {
  String _title = "ISVAL";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            )),
        IconButton(
            onPressed: _onPress,
            icon: Icon(
              Icons.menu,
            ))
      ],
    );
  }

  void _onPress() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext build) {
      return Menu();
    }));
  }
}
