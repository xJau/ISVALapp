import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isval_test/Components/record.dart';
import 'package:isval_test/Components/record_list_header.dart';
import 'package:isval_test/Interfaces/i_shipment_model.dart';
import 'package:isval_test/Models/customer.dart';
import 'package:isval_test/Models/entry_model.dart';
import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Models/user.dart';
import 'package:isval_test/Services/login_service.dart';
import 'package:string_similarity/string_similarity.dart';

enum RecordType { STOCK, ORDERS, TOTAL_STOCK, SHIPMENTS, USSHIPMENTS }

extension RecordTypeExtension on RecordType {
  String get name {
    switch (this) {
      case RecordType.ORDERS:
        return "ORDER";
      case RecordType.STOCK:
        return "STOCK";
      case RecordType.TOTAL_STOCK:
        return "TOTAL STOCK";
      case RecordType.SHIPMENTS:
        return "SHIPMENTS";
      case RecordType.USSHIPMENTS:
        return "SHIPMENTS";
      default:
        return "UNSUPPORTED";
    }
  }

  IconData get icon {
    switch (this) {
      case RecordType.ORDERS:
        return Icons.plagiarism;
      case RecordType.STOCK:
        return FontAwesomeIcons.box;
      case RecordType.TOTAL_STOCK:
        return FontAwesomeIcons.chartBar;
      case RecordType.SHIPMENTS:
        return FontAwesomeIcons.dollyFlatbed;
      case RecordType.USSHIPMENTS:
        return FontAwesomeIcons.dollyFlatbed;
      default:
        return Icons.error;
    }
  }
}

///A list of possible records with their relative entries. It's the component that
///has the Client Code and displays all of the infos for the relative item. It can
///be customized by passing a [type] of record
// ignore: must_be_immutable
class RecordList extends StatelessWidget {
  late final List<IRecord> _model;
  late final int itemCount;
  late List<Record> _records;
  late Map<String, dynamic> _values;
  late List<EntryModel> _entries;
  late final RecordType _type;
  var _searchText;
  RecordList(
    this._model,
    this._type, [
    this._searchText = "",
    this.itemCount = -1,
  ]);
  @override
  Widget build(BuildContext context) {
    _records = [];
    List<Record> _tempRecords = [];
    //For all the entries in the Record List
    for (var i = 0; i < _model.length; i++) {
      //We take all of its entries
      if (i == itemCount) break;
      _values = _model[i].getAttributes(getCategory());
      _entries = [];
      for (var j = 0; j < _values.keys.length; j++) {
        //And we create Entry Models for them
        var element = _values.keys.toList()[j];
        var value = _values[element];
        if (value != null) {
          if (element == "CARRIER") {
            Object mod = _model[i];
            if (mod is IShipmentModel)
              _entries
                  .add(new EntryModel(element, value, mod.getShipmentType()));
          } else
            _entries.add(new EntryModel(element, value));
        }
      }
      //Once we mapped all of the entries for a record we add the record
      _tempRecords.add(new Record(_model[i].getRecordName(), _entries));
      if (_searchText != "") {
        _records = _tempRecords
            .where((i) => i.getName().similarityTo(_searchText) > 0.8)
            .toList();
      } else {
        _records = _tempRecords;
      }
    }
    //And we return a List View containing the header of the Record List
    //and all of its relative records

    return Padding(
        padding: const EdgeInsets.all(20),

        ///TODO: Check if column can be removed
        child: Column(children: [
          RecordListHeader(_type, itemCount),
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: _records.toList())
        ]));
  }

  CustomerCategory getCategory() {
    Customer currentCustomer = LoginInstance().currentCustomer;
    return currentCustomer.category;
  }
}
