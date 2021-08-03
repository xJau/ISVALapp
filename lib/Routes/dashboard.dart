import 'package:flutter/material.dart';
import 'package:isval_test/Components/header.dart';
import 'package:isval_test/Components/record_list.dart';
import 'package:isval_test/Utility/colorscheme.dart';

class DashboardRoute extends StatelessWidget {
  const DashboardRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorpalette.SFONDO_PAGINA,
        appBar: Header(),
        body: Center(child: RecordList(RecordType.STOCK)));
  }
}
