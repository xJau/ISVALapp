import 'package:flutter/material.dart';
import 'package:isval_test/Components/record_list.dart';
import 'package:isval_test/Components/record_list_header.dart';
import 'package:isval_test/Components/stockbox.dart';

class TotalStockGrid extends StatelessWidget {
  final List<StockBox> _boxes;

  const TotalStockGrid(this._boxes);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          RecordListHeader(RecordType.TOTAL_STOCK),
          Column(children: [
            Row(
              children: _boxes.sublist(0, 3),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            Row(
              children: _boxes.sublist(3, 6),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )
          ])
        ]));
  }
}
