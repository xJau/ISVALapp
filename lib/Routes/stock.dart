import 'package:flutter/material.dart';
import 'package:isval_test/Components/header.dart';
import 'package:isval_test/Components/record_list.dart';
import 'package:isval_test/Utility/colorpalette.dart';

class StocksRoute extends StatelessWidget {
  const StocksRoute();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorpalette.SFONDO_PAGINA,
        appBar: Header(),
        body: Center(child: RecordList(RecordType.STOCK)));
  }
}
