import 'package:flutter/material.dart';
import 'package:isval_test/Utility/colorpalette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OrdersRoute extends StatelessWidget {
  const OrdersRoute();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.8;
    double screenHeight = MediaQuery.of(context).size.height * 0.8;
    double containerHeigth = screenHeight / 5;

    return Scaffold(
        backgroundColor: Colorpalette.BIANCO,
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Part number"),
                            Spacer(),
                            IconButton(
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.clear,
                                  size: 40,
                                  color: Colorpalette.AZZURRO_3,
                                ))
                          ],
                        ),
                        Text("NUMERO ORDINE"),
                        SizedBox(height: 20),
                        Text("Order created on"),
                        SizedBox(height: 20),
                        Text("Total units"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  blackBox(),
                  SizedBox(height: 20),
                  whitebox(38, "IN PROGRESS", 110),
                  SizedBox(height: 20),
                  whitebox(14, "IN THE NEXT 90 DAYS", 41),
                  SizedBox(height: 20),
                  whitebox(4, "TO BE SCHEDULED", 12),
                ],
              ),
            ),
          ],
        ));
  }

  Widget blackBox() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              colors: [Colorpalette.GRIGIO_6, Colorpalette.GRIGIO_7])),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 40),
      height: 250,
      width: 1000,
      child: Row(
        children: [
          CircularPercentIndicator(
            animation: true,
            radius: 200,
            lineWidth: 30,
            percent: .44,
            linearGradient: LinearGradient(
                colors: [Colorpalette.AZZURRO_3, Colorpalette.AZZURRO_1]),
            backgroundColor: Colorpalette.GRIGIO_2,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text("44%",
                style: TextStyle(fontSize: 60, color: Colorpalette.BIANCO)),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Ready for shipment",
                  style: TextStyle(fontSize: 15, color: Colorpalette.BIANCO)),
              Text("129",
                  style: TextStyle(fontSize: 30, color: Colorpalette.BIANCO)),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget whitebox(double percentage, String scritta, int value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colorpalette.GRIGIO_1,
      ),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 40),
      height: 250,
      width: 1000,
      child: Row(
        children: [
          CircularPercentIndicator(
            animation: true,
            radius: 200,
            lineWidth: 30,
            percent: percentage / 100,
            linearGradient: LinearGradient(
                colors: [Colorpalette.AZZURRO_3, Colorpalette.AZZURRO_1]),
            backgroundColor: Colorpalette.GRIGIO_2,
            circularStrokeCap: CircularStrokeCap.round,
            center: Text("$percentage%",
                style:
                    TextStyle(fontSize: 60, color: Colorpalette.AZZURRO_ISVAL)),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(scritta,
                  style: TextStyle(fontSize: 15, color: Colorpalette.GRIGIO_7)),
              Text("$value",
                  style: TextStyle(fontSize: 30, color: Colorpalette.GRIGIO_7)),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
