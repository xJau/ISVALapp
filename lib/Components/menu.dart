import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isval_test/Components/menu_user_info.dart';
import 'package:isval_test/Utility/colorpalette.dart';
import 'package:isval_test/routes.dart';

class Menu extends StatelessWidget {
  final double menu_font_size = 20.0;
  final Color menu_header_color = Colorpalette.AZZURRO_ISVAL;
  final double spacing = 30.0;

  const Menu();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorpalette.BIANCO,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colorpalette.BIANCO,
          actions: [Image.asset('assets/images/isval_longlogo.png',),SizedBox(width: 20,)],
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
                SizedBox(height: spacing),
                InkWell(
                    child: Text("STOCKS",
                        style: TextStyle(
                            color: menu_header_color,
                            fontSize: menu_font_size)),
                    onTap: () =>
                        Navigator.of(context).pushNamed(RouteGenerator.stock)),
                SizedBox(height: spacing),
                InkWell(
                    child: Text(
                      "SPEDIZIONI",
                      style: TextStyle(
                          color: menu_header_color, fontSize: menu_font_size),
                    ),
                    onTap: () => Navigator.of(context)
                        .pushNamed(RouteGenerator.shipping)),
                SizedBox(height: spacing),
                InkWell(
                    child: Text(
                      "ORDINI",
                      style: TextStyle(
                          color: menu_header_color, fontSize: menu_font_size),
                    ),
                    onTap: () =>
                        Navigator.of(context).pushNamed(RouteGenerator.orders)),
                SizedBox(height: spacing),
                InkWell(
                    child: Text("METRICS?",
                        style: TextStyle(
                            color: menu_header_color,
                            fontSize: menu_font_size)),
                    onTap: () => Navigator.of(context)
                        .pushNamed(RouteGenerator.metrics)),
              ])),
              MenuUserInfo()
            ])));
  }
}
