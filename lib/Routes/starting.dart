import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:isval_test/Routes/login.dart';
import 'package:isval_test/Utility/colorpalette.dart';

import 'dashboard.dart';

class StartingRoute extends StatelessWidget {
  const StartingRoute();
  final int _current = 0;

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    final pageView = PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: [
        firstPage(),
        secondPage(),
        thirdPage(context),
      ],
    );
    return pageView;
  }

  Widget firstPage() {
    return Scaffold(
        backgroundColor: Colorpalette.GRIGIO_1,
        body: Column(
          children: [
            Spacer(),
            Image.asset(
              'assets/images/isval_logo.png',
              scale: 1.2,
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                Container(
                  height: 200,
                  width: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colorpalette.AZZURRO_GRIGIO,
                      border:
                          Border.all(width: 4, color: Colorpalette.AZZURRO_1),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Text('Questa é la pagina iniziale Isval'),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            // Row(children: dots()),
            Spacer()
          ],
        ));
  }

  Widget secondPage() {
    return Scaffold(
        backgroundColor: Colorpalette.GRIGIO_1,
        body: Column(
          children: [
            Spacer(),
            Image.asset(
              'assets/images/isval_logo.png',
              scale: 1.2,
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                Container(
                  height: 200,
                  width: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colorpalette.AZZURRO_GRIGIO,
                      border:
                          Border.all(width: 4, color: Colorpalette.AZZURRO_1),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Text('Questa é la pagina iniziale Isval2'),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            // Row(children: dots()),
            Spacer()
          ],
        ));
  }

  Widget thirdPage(BuildContext context) {
    return Scaffold(
        backgroundColor: Colorpalette.GRIGIO_1,
        body: Column(
          children: [
            Spacer(),
            Image.asset(
              'assets/images/isval_logo.png',
              scale: 1.2,
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                Container(
                  height: 200,
                  width: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colorpalette.AZZURRO_GRIGIO,
                      border:
                          Border.all(width: 4, color: Colorpalette.AZZURRO_1),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          topLeft: Radius.circular(30))),
                  child: Text('Questa é la pagina iniziale Isval3'),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(children: [
              Spacer(),
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colorpalette.AZZURRO_1, Colorpalette.AZZURRO_2],
                      stops: [0.0008194930069930072, 0.9992897727272727],
                      begin: Alignment(-0.71, -0.71),
                      end: Alignment(0.71, 0.71),
                      // angle: 135,
                      // scale: undefined,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x690a7bc0),
                          offset: Offset(0, 2),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                  onPressed: () {
        
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext ctx) => LoginRoute()));
                    
                    HapticFeedback.lightImpact();
                  },
                  child: Text('Procedi al Login',
                      style: TextStyle(fontSize: 10, color: Colors.white)),
                ),
              ),
              Spacer()
            ]),
            Spacer()
          ],
        ));
  }

  // List<Widget> dots(int index) {
  //   List<Widget> dots = [];
  //   for (int i = 0; i < 3; i++) {
  //     Widget dot = Container(
  //         width: 8.0,
  //         height: 8.0,
  //         margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
  //         decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //             color: _current == index
  //                 ? Color.fromRGBO(0, 0, 0, 0.9)
  //                 : Color.fromRGBO(0, 0, 0, 0.4)));
  //     dots.add(dot);
  //   }
  //   return dots;
  // }
}
