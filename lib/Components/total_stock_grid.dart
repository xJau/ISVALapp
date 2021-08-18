import 'package:flutter/material.dart';
import 'package:isval_test/Components/record_list.dart';
import 'package:isval_test/Components/record_list_header.dart';
import 'package:isval_test/Components/stockbox.dart';
import 'package:isval_test/Models/customer.dart';
import 'package:isval_test/Services/login_service.dart';

class TotalStockGrid extends StatelessWidget {
  final List<StockBox> _boxes;
  late int extraFields;
  TotalStockGrid(this._boxes);
  @override
  Widget build(BuildContext context) {
    switch (getCategory()) {
      case CustomerCategory.A1:
        extraFields = 2;
        break;
      case CustomerCategory.A2:
        extraFields = 3;
        break;
      case CustomerCategory.A4:
        extraFields = -1;
        break;
    }

    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          RecordListHeader(RecordType.TOTAL_STOCK),
          Column(children: [
            Row(
              children: _boxes.sublist(0, extraFields > 0 ? 3 : 2),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            if (extraFields > 0)
              Row(
                children: _boxes.sublist(3, 3 + extraFields),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )
          ])
        ]));
  }

  CustomerCategory getCategory() {
    return LoginInstance().currentCustomer.category;
  }
}
