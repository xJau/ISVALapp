import 'package:flutter/material.dart';
import 'package:isval_test/Components/record.dart';
import 'package:isval_test/Components/record_list_header.dart';
import 'package:isval_test/Models/entry_model.dart';
import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Models/total_stock_model.dart';
import 'package:isval_test/Services/api_service.dart';

enum RecordType {
  STOCK,
}

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

  // Da rimuovere in caso il programma ci metta troppo.
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          FutureBuilder<List<IRecord>>(
              future: _model,
              builder: (BuildContext ctx, AsyncSnapshot<List<IRecord>> snap) {
                if (snap.hasData) {
                  var model = snap.data;
                  _records = [];
                  for (var i = 0; i < model!.length; i++) {
                    _values = model[i].getAttributes();
                    _entries = [];
                    for (var j = 0; j < _values.keys.length; j++) {
                      var element = _values.keys.toList()[j];
                      var value = _values[element];
                      if (value != null)
                        _entries.add(new EntryModel(element, value));
                    }
                    _records
                        .add(new Record(model[i].getRecordName(), _entries));
                  }
                  return Expanded(
                      child: ListView(children: [
                    RecordListHeader(RecordType.STOCK),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: _records.toList())
                  ]));
                } else {
                  return Text("Loading");
                }
              })
        ]));
  }
}
