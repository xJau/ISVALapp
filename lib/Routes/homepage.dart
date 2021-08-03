import 'package:flutter/material.dart';
import 'package:isval_test/Components/header.dart';
import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Services/api_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _wip = 0;
  int _ita = 0;
  int _via = 0;
  int _usa = 0;
  int _tcu = 0;
  int _cns = 0;

  late List<IRecord> stock;

  void _importStock() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Wip number:',
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _importStock,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
