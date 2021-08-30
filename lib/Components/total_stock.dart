import 'package:flutter/material.dart';

import 'package:isval_test/Components/stockbox.dart';
import 'package:isval_test/Components/total_stock_grid.dart';
import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Models/customer.dart';
import 'package:isval_test/Models/entry_model.dart';
import 'package:isval_test/Models/user.dart';

import 'package:isval_test/Services/login_service.dart';

class TotalStock extends StatelessWidget {
  @override
  late List<IRecord> _model;
  late List<StockBox> _details;

  TotalStock(this._model);

  Widget build(BuildContext context) {
    _details = [];
    _model.forEach((element) {
      var attrs = element.getAttributes(getCategory());
      attrs.keys.forEach((element) {
        var value = attrs[element];
        if (value != null) _details.add(StockBox(EntryModel(element, value)));
      });
    });

    return Column(children: [TotalStockGrid(_details)]);
  }
}

CustomerCategory getCategory() {
  return LoginInstance().currentCustomer.category;
}
