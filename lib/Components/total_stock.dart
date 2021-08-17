import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isval_test/Components/entry.dart';
import 'package:isval_test/Components/stockbox.dart';
import 'package:isval_test/Components/total_stock_grid.dart';
import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Models/entry_model.dart';
import 'package:isval_test/Services/api_service.dart';
import 'package:isval_test/Utility/colorpalette.dart';

class TotalStock extends StatelessWidget {
  @override
  late List<IRecord> _model;
  late List<StockBox> _details;

  TotalStock(this._model);

  Widget build(BuildContext context) {
    _details = [];
    _model.forEach((element) {
      var attrs = element.getAttributesA2();
      attrs.keys.forEach((element) {
        var value = attrs[element];
        if (value != null) _details.add(StockBox(EntryModel(element, value)));
      });
    });

    return Column(children: [TotalStockGrid(_details)]);
  }
}
