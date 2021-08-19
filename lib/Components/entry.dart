import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:isval_test/Models/entry_model.dart';
import 'package:isval_test/Routes/stock_detail_page.dart';
import 'package:isval_test/Utility/colorpalette.dart';
import 'package:isval_test/routes.dart';

enum Decorator { NONE, BUTTON, VEHICLE, SHIPMENT, TRACKING, DATE }

class Entry extends StatelessWidget {
  final EntryModel _model;
  late String searchText;
  Entry(this._model,[this.searchText = '']);
  @override

  static const Map<String, Decorator> nameDecorators = {
    "SHIPMENT": Decorator.VEHICLE,
    "IN TRANSIT TO THE US": Decorator.BUTTON,
    "IN TRANSIT TO YOU": Decorator.BUTTON,
    "CARRIER": Decorator.VEHICLE,
    "TRACKING NUMBER": Decorator.TRACKING,
    "ETA TO US WAREHOUSE": Decorator.DATE,
  };

  Decorator _getDecoratorFromName(String name) {
    var x = nameDecorators[name];
    if (x == null)
      return Decorator.NONE;
    else
      return x;
  }

  String _getRouteFromName(String _name) {
    switch (_name) {
      case "WIP":
        return RouteGenerator.orders;
      default:
        return RouteGenerator.stock;
    }
  }

  List<Widget> _getIconByType() {
    List<Widget> icon = [];
    switch (_model.shipmentType) {
      case "TRUCK":
        icon.add(Icon(FontAwesomeIcons.truck, size: 20));
        break;
      case "VETTORE":
        icon.add(Icon(FontAwesomeIcons.truck, size: 20));
        break;
      case "SHIP":
        icon.add(Icon(FontAwesomeIcons.ship, size: 20));
        break;
      case "PLANE":
        icon.add(Icon(FontAwesomeIcons.plane, size: 10));
        break;
      case "OCEAN+TRUCK":
        icon.add(Icon(FontAwesomeIcons.ship, size: 20));
        icon.add(SizedBox(width: 5));
        icon.add(Icon(FontAwesomeIcons.plus, size: 10));
        icon.add(SizedBox(width: 5));
        icon.add(Icon(FontAwesomeIcons.truck, size: 20));
        break;
      default:
        icon.add(Icon(Icons.error));
        break;
    }

    return icon;
  }

  Widget createEntry(_model, context) {
    switch (_getDecoratorFromName(_model.name)) {
      case Decorator.BUTTON:
        return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_model.name,
                    style: TextStyle(color: Colorpalette.AZZURRO_ISVAL)),
                SizedBox(height: 3),
                Row(children: [
                  Text(_model.value),
                  SizedBox(width: 10),
                  _detailButton(context, _model.value,searchText)
                ]),
                SizedBox(height: 20),
              ],
            ));
      case Decorator.VEHICLE:
        return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_model.name,
                    style: TextStyle(color: Colorpalette.AZZURRO_ISVAL)),
                SizedBox(height: 3),
                Row(children: [
                  Row(children: _getIconByType()),
                  SizedBox(width: 10),
                  Text(_model.value),
                  SizedBox(width: 5),
                  _detailButton(context, _model.value,searchText),
                ]),
                SizedBox(height: 20),
              ],
            ));
      case Decorator.DATE:
        DateTime date = dateConversion(_model.value);
        return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_model.name,
                    style: TextStyle(color: Colorpalette.AZZURRO_ISVAL)),
                SizedBox(height: 3),
                Row(children: [
                  Text(dateConverter(date)),
                ]),
                SizedBox(height: 20),
              ],
            ));
      case Decorator.TRACKING:
        return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_model.name,
                    style: TextStyle(color: Colorpalette.AZZURRO_ISVAL)),
                SizedBox(height: 3),
                Row(children: [
                  _getTrackColor(_model.value == ''),
                  SizedBox(width: 10),
                  Text(_model.value == '' ? ' -' : _model.value),
                ]),
                SizedBox(height: 20),
              ],
            ));
      default:
        return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_model.name,
                    style: TextStyle(color: Colorpalette.AZZURRO_ISVAL)),
                SizedBox(height: 3),
                Text(_model.value),
                SizedBox(height: 20),
              ],
            ));
    }
  }

  Widget _detailButton(context, value,search) {
    if (value == '0') return Container();
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1.5, color: Colorpalette.AZZURRO_ISVAL)),
      alignment: Alignment.center,
      child: IconButton(
        hoverColor: Colors.transparent,
        splashColor: Colorpalette.AZZURRO_GRIGIO,
        splashRadius: 15,
        iconSize: 15,
        padding: EdgeInsets.zero,
        onPressed: () =>
            Navigator.of(context).push(detailRoute(search)),
        icon: Icon(
          Icons.search_outlined,
          color: Colorpalette.AZZURRO_ISVAL,
        ),
      ),
    );
  }
  //TODO da rimuovere e sistemare in altro modo
  Route detailRoute(search){
    return PageRouteBuilder(pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              StockDetailRoute(search) );
  }

  @override
  Widget build(BuildContext context) {
    return createEntry(_model, context);
  }

  Widget _getTrackColor(bool before) {
    Color trackColor = before ? Colors.red : Colors.green;
    Color shadowColor = before ? Colors.redAccent : Colors.greenAccent;
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: trackColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: shadowColor,
            )
          ]),
    );
  }

  DateTime dateConversion(String stringDate) {
    String correct = (stringDate.substring(0, 4) +
        '-' +
        stringDate.substring(4, 6) +
        '-' +
        stringDate.substring(6, 8));
    DateTime date = DateFormat('yyyy-MM-dd').parseStrict(correct);
    return date;
  }

  String dateConverter(DateTime date, [bool usa = false]) {
    String convertedDate;
    usa
        ? convertedDate = (date.year.toString() +
            '/' +
            date.month.toString() +
            '/' +
            date.day.toString())
        : convertedDate = (date.day.toString() +
            '/' +
            date.month.toString() +
            '/' +
            date.year.toString());
    return convertedDate;
  }
}

