import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isval_test/Models/entry_model.dart';
import 'package:isval_test/Utility/colorpalette.dart';
import 'package:isval_test/routes.dart';

enum Decorator { NONE, BUTTON, VEHICLE }

class Entry extends StatelessWidget {
  final EntryModel _model;

  static const Map<String, Decorator> nameDecorators = {
    "WIP": Decorator.BUTTON,
    "SHIPMENT": Decorator.VEHICLE,
    "IN TRANSIT TO THE US": Decorator.BUTTON,
    "IN TRANSIT TO YOU": Decorator.BUTTON,
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

  const Entry(this._model);

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
                  SizedBox(width: 5),
                  ElevatedButton(
                      onPressed: () => {
                            Navigator.of(context)
                                .pushNamed(_getRouteFromName(_model.name))
                          },
                      child: Icon(Icons.search))
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

  @override
  Widget build(BuildContext context) {
    return createEntry(_model, context);
  }
}
