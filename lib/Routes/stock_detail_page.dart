import 'package:flutter/material.dart';
import 'package:isval_test/Components/Containers/record_list_container.dart';
import 'package:isval_test/Components/header.dart';
import 'package:isval_test/Components/record_list.dart';
import 'package:isval_test/Utility/colorpalette.dart';

class StockDetailRoute extends StatelessWidget {
  const StockDetailRoute(this.partNumber);
  final partNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorpalette.SFONDO_PAGINA,
        appBar: Header(),
        body: Center(
          child: ListView(
            children: [RecordListContainer(RecordType.USSHIPMENTS,partNumber)],
          ),
        ));
  }
}
