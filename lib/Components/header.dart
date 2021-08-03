import 'package:flutter/material.dart';
import 'package:isval_test/Components/menu.dart';
import 'package:isval_test/Utility/colorscheme.dart';

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
      backgroundColor: Colorscheme.BIANCO,
      title: Text(_title, style: TextStyle(color: Colorscheme.AZZURRO_ISVAL)),
      actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colorscheme.AZZURRO_ISVAL)),
        IconButton(
            onPressed: _onPress,
            icon: Icon(Icons.menu, color: Colorscheme.AZZURRO_ISVAL))
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
