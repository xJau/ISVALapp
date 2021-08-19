import 'package:flutter/material.dart';
import 'package:isval_test/Components/record_list.dart';
import 'package:isval_test/Utility/colorpalette.dart';
import 'package:isval_test/routes.dart';

///This is the header of a single Record List. It's the component that contains
///the Logo and the title of said list.
class RecordListHeader extends StatelessWidget {
  final RecordType _type;
  late final IconData _headerIcon;
  late final String _headerText;
  late final int _entriesNumber;
  RecordListHeader(this._type, [this._entriesNumber = -1]) {
    this._headerIcon = this._type.icon;
    this._headerText = this._type.name;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
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
              child: Icon(
                _headerIcon,
                color: Colors.white,
                size: 17,
              )),
          SizedBox(width: 10),
          Text(this._headerText,
              style: TextStyle(color: Colorpalette.AZZURRO_ISVAL,
            fontSize: 16,fontWeight: FontWeight.w700)),
          if (_entriesNumber > 0) Spacer(),
          if (_entriesNumber > 0) viewMore(context)
        ],
      ),
    );
  }

  Widget viewMore(context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colorpalette.AZZURRO_ISVAL, width: 1.5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(_getRouteFromName(_headerText));
        },
        child: Text("View All",
            style: TextStyle(
                color: Colorpalette.AZZURRO_ISVAL,
                fontWeight: FontWeight.w600)),
      ),
    );
  }

   String _getRouteFromName(String _name) {
    switch (_name) {
      case "STOCK":
        return RouteGenerator.stockDetail;
      case "SHIPMENTS":
        return RouteGenerator.shipping;
      default:
        return RouteGenerator.stock;
    }
  }
}
