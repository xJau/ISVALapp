import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("test"),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.map),
              title: Text('dashboard'),
            ),
            Text('stock'),
            Text('spedizioni'),
            Text('ordini'),
            Text('metrics?')
          ],
        )
      );
  }
}