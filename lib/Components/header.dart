import 'package:flutter/material.dart';
import 'package:isval_test/Utility/colorpalette.dart';
import 'package:isval_test/routes.dart';

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
      automaticallyImplyLeading: false,
      backgroundColor: Colorpalette.BIANCO,
      title: Text(_title, style: TextStyle(color: Colorpalette.AZZURRO_ISVAL)),
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colorpalette.AZZURRO_ISVAL)),
        IconButton(
            onPressed: _onPress,
            icon: Icon(Icons.menu, color: Colorpalette.AZZURRO_ISVAL))
      ],
    );
  }

  void _onPress() {
    Navigator.of(context).pushNamed(RouteGenerator.menu);
  }
}
