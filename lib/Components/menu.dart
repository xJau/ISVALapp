import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isval_test/Components/menu_user_info.dart';
import 'package:isval_test/Utility/colorpalette.dart';
import 'package:isval_test/routes.dart';

class Menu extends StatelessWidget {
  final double menu_font_size = 20.0;
  final Color menu_header_color = Colorpalette.AZZURRO_ISVAL;

  const Menu();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colorpalette.BIANCO,
          title: Text("ISVAL", style: TextStyle(color: menu_header_color)),
          iconTheme: IconThemeData(color: Colorpalette.AZZURRO_ISVAL),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Expanded(
                  child: ListView(children: [
                InkWell(
                    child: Text(
                      "DASHBOARD",
                      style: TextStyle(
                          color: menu_header_color, fontSize: menu_font_size),
                    ),
                    onTap: () => Navigator.of(context)
                        .pushNamed(RouteGenerator.dashboard)),
                SizedBox(height: 10),
                InkWell(
                    child: Text("STOCKS",
                        style: TextStyle(
                            color: menu_header_color,
                            fontSize: menu_font_size)),
                    onTap: () =>
                        Navigator.of(context).pushNamed(RouteGenerator.stock)),
                SizedBox(height: 10),
                InkWell(
                    child: Text(
                      "SPEDIZIONI",
                      style: TextStyle(
                          color: menu_header_color, fontSize: menu_font_size),
                    ),
                    onTap: () => Navigator.of(context)
                        .pushNamed(RouteGenerator.shipping)),
                SizedBox(height: 10),
                InkWell(
                    child: Text(
                      "ORDINI",
                      style: TextStyle(
                          color: menu_header_color, fontSize: menu_font_size),
                    ),
                    onTap: () =>
                        Navigator.of(context).pushNamed(RouteGenerator.orders)),
                SizedBox(height: 10),
                InkWell(
                    child: Text("METRICS?",
                        style: TextStyle(
                            color: menu_header_color,
                            fontSize: menu_font_size)),
                    onTap: () => Navigator.of(context)
                        .pushNamed(RouteGenerator.metrics)),
              ])),
              Expanded(
                  child: Align(
                      child: MenuUserInfo(),
                      alignment: FractionalOffset.bottomLeft))
            ])));
  }
}
