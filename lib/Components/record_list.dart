import 'package:flutter/material.dart';
import 'package:isval_test/Components/record.dart';
import 'package:isval_test/Components/record_list_header.dart';
import 'package:isval_test/Models/entry_model.dart';
import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Services/api_service.dart';

enum RecordType {
  STOCK,
}

///A list of possible records with their relative entries. It's the component that
///has the Client Code and displays all of the infos for the relative item. It can
///be customized by passing a [type] of record
class RecordList extends StatefulWidget {
  late final RecordType type;

  RecordList(this.type);

  @override
  _RecordListState createState() => _RecordListState();
}

class _RecordListState extends State<RecordList> {
  late Map<String, String> _values;
  late List<EntryModel> _entries;
  late List<Record> _records;
  late Future<List<IRecord>> _model;
  @override
  void initState() {
    switch (widget.type) {
      case (RecordType.STOCK):
        _model = ApiService.getDetailedStocks('ACL002');
        break;
      default:
        break;
    }
    super.initState();
  }

  // To remove in case the build takes too much
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          //The future builder checks for the state of the [_model] Future and reacts
          //accordingly
          FutureBuilder<List<IRecord>>(
              future: _model,
              builder: (BuildContext ctx, AsyncSnapshot<List<IRecord>> snap) {
                //if the Future has finished loading then we create the Models
                if (snap.hasData) {
                  var model = snap.data;
                  _records = [];
                  //For all the entries in the Record List
                  for (var i = 0; i < model!.length; i++) {
                    //We take all of its entries
                    _values = model[i].getAttributes();
                    _entries = [];
                    for (var j = 0; j < _values.keys.length; j++) {
                      //And we create Entry Models for them
                      var element = _values.keys.toList()[j];
                      var value = _values[element];
                      if (value != null)
                        _entries.add(new EntryModel(element, value));
                    }
                    //Once we mapped all of the entries for a record we add the record
                    _records
                        .add(new Record(model[i].getRecordName(), _entries));
                  }
                  //And we return a List View containing the header of the Record List
                  //and all of its relative records
                  return Expanded(
                      child: ListView(children: [
                    RecordListHeader(RecordType.STOCK),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: _records.toList())
                  ]));
                } else {
                  //If the Future hasn't loaded yet we display Loading
                  return Text(
                      "Loading"); //TODO: Add a more beautiful loading Widget
                }
              })
        ]));
  }
}
