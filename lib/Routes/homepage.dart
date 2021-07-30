import 'package:flutter/material.dart';
import 'package:isval_test/Components/header.dart';
import 'package:isval_test/Models/stock.dart';
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

  late Stock stock;

  void _importStock() {
    ApiService.getStock('ABE001').then((value) => {updateStock(value)});
  }

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

  updateStock(Stock value) {
    stock = value;
    setState(() {
      _wip = stock.totalStocks[0].wip;
      _ita = stock.totalStocks[0].stockIta;
      _via = stock.totalStocks[0].stockTrtoUs;
      _usa = stock.totalStocks[0].stockUs;
      _tcu = stock.totalStocks[0].stockTrtoYou;
      _cns = stock.totalStocks[0].consignment;
    });
  }
}
