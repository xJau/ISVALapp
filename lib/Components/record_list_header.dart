import 'package:flutter/material.dart';
import 'package:isval_test/Components/record_list.dart';
import 'package:isval_test/Utility/colorscheme.dart';

///This is the header of a single Record List. It's the component that contains
///the Logo and the title of said list.
class RecordListHeader extends StatelessWidget {
  
  final RecordType _type;
  const RecordListHeader(this._type);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(children: [
          SizedBox(width: 10),
          Container(
              width: 36,
              height: 36,
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.lightBlue],
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
                  shape: BoxShape.circle),
              child: Icon(Icons.shopping_bag_outlined, color: Colors.white)),
          SizedBox(width: 10),
          Text("STOCK", style: TextStyle(color: Colorpalette.AZZURRO_ISVAL))
        ]));
  }
}
