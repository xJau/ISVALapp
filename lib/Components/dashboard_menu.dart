import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isval_test/Components/record_list.dart';
import 'package:isval_test/Components/total_stock.dart';
import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Services/api_service.dart';
import 'package:isval_test/Utility/colorpalette.dart';

class DashboardMenu extends StatefulWidget {
  _DashboardMenuState createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<StatefulWidget> {
  late Future<List<IRecord>> _stockModel;
  late Future<List<IRecord>> _detailedStockModel;
  late List<IRecord> _stock;
  late List<IRecord> _detailedStock;
  late var _models;

  @override
  void initState() {
    _stockModel = ApiService.getStock("ACL002");
    _detailedStockModel = ApiService.getDetailedStocks("ACL002");
    _models = Future.wait([
      _stockModel.then((value) => _stock = value),
      _detailedStockModel.then((value) => _detailedStock = value)
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _models,
      builder: (ctx, snap) {
        if (snap.hasData) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  cacheExtent: 500000,
                  children: [
                    Expanded(child: TotalStock(_stock)),
                    Expanded(
                        child: RecordList(_detailedStock, RecordType.STOCK, 3))
                  ],
                ),
              )
            ],
          );
        } else
          return SpinKitFadingCircle(
            itemBuilder: (ctx, idx) {
              return DecoratedBox(
                  decoration: BoxDecoration(color: Colorpalette.AZZURRO_ISVAL));
            },
          );
      },
    );
  }
}
