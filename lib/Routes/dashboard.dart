import 'package:flutter/material.dart';
import 'package:isval_test/Components/header.dart';
import 'package:isval_test/Components/record_list.dart';

class DashboardRoute extends StatelessWidget {
  const DashboardRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(), body: Center(child: RecordList(RecordType.STOCK)));
  }
}
