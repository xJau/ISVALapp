import 'package:flutter/material.dart';
import 'package:isval_test/Components/dashboard_menu.dart';
import 'package:isval_test/Components/header.dart';
import 'package:isval_test/Utility/colorpalette.dart';

class DashboardRoute extends StatelessWidget {
  const DashboardRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorpalette.SFONDO_PAGINA,
        appBar: Header(),
        body: Center(child: DashboardMenu()));
  }
}
