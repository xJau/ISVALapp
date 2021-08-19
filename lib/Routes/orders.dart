import 'package:flutter/material.dart';
import 'package:isval_test/Components/Containers/record_list_container.dart';
import 'package:isval_test/Components/header.dart';
import 'package:isval_test/Components/record_list.dart';
import 'package:isval_test/Utility/colorpalette.dart';

class OrdersRoute extends StatelessWidget {
  const OrdersRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        backgroundColor: Colorpalette.SFONDO_COLONNA,
        body: Center(
          child: RecordListContainer(RecordType.ORDERS,''),
        ));
  }
}
