import 'package:flutter/material.dart';
import 'package:isval_test/Components/record.dart';
import 'package:isval_test/Models/entry_model.dart';
import 'package:isval_test/Models/i_record_model.dart';
import 'package:isval_test/Models/stock.dart';
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
  late Future<Stock> _model;
  @override
  void initState() {
    switch (widget.type) {
      case (RecordType.STOCK):
        _model = ApiService.getStock('ABE001');
        break;
      default:
        break;
    }
    _entries = [];
    _records = [];
    super.initState();
  }

  void retry() {
    setState(() {
      _model = ApiService.getStock('ABE001');
    });
  }

  // Da rimuovere in caso il programma ci metta troppo.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Stocks"),
        FutureBuilder<Stock>(
            future: _model,
            builder: (BuildContext ctx, AsyncSnapshot<Stock> snap) {
              if (snap.hasData) {
                var model = snap.data!.totalStocks;
                for (var i = 0; i < model.length; i++) {
                  _values = model[i].getAttributes();
                  _entries = [];
                  for (var j = 0; j < _values.keys.length; j++) {
                    var element = _values.keys.toList()[j];
                    var value = _values[element];
                    if (value != null)
                      _entries.add(new EntryModel(element, value));
                  }
                  _records.add(new Record("Stock", _entries));
                }
                return Expanded(
                    child: ListView.builder(
                        itemCount: _records.length,
                        itemBuilder: (context, index) => _records[index]));
              } else {
                return Text("Loading");
              }
            }),
        ElevatedButton(onPressed: retry, child: Text("Retry"))
      ],
    );
  }
}
