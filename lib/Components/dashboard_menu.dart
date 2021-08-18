import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isval_test/Components/record_list.dart';
import 'package:isval_test/Components/total_stock.dart';
import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Models/customer.dart';
import 'package:isval_test/Services/api_service.dart';
import 'package:isval_test/Services/login_service.dart';
import 'package:isval_test/Utility/colorpalette.dart';

import 'header.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class DashboardMenu extends StatefulWidget {
  _DashboardMenuState createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<StatefulWidget> {
  LoginInstance accountInstance = LoginInstance(); 
  late Future<List<IRecord>> _stockModel;
  late Future<List<IRecord>> _detailedStockModel;
  late List<IRecord> _stock;
  late List<IRecord> _detailedStock;
  late var _models;
  var _searchText = "";
  late String _codeCustomer;

  @override
  void initState() {
    getCustomerCode();
    _stockModel = ApiService.getStock(_codeCustomer);
    _detailedStockModel = ApiService.getDetailedStocks(_codeCustomer);
    _models = Future.wait([
      _stockModel.then((value) => _stock = value),
      _detailedStockModel.then((value) => _detailedStock = value)
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FutureBuilder(
        future: _models,
        builder: (ctx, snap) {
          if (snap.hasData) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    cacheExtent: 500000,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: "search"),
                        onChanged: (text) {
                          this._searchText = text;
                          setState(() {});
                        },
                      ),
                      TotalStock(_stock),
                      RecordList(_detailedStock, RecordType.STOCK, 3, _searchText)
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
      ),
    );
  }

  void getCustomerCode(){
    Customer currentCustomer = accountInstance.currentCustomer;
    _codeCustomer = currentCustomer.code;
  }
}
