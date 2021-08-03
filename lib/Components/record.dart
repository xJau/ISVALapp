import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isval_test/Components/entry.dart';
import 'package:isval_test/Models/entry_model.dart';

class Record extends StatelessWidget {
  final String _name;
  final List<EntryModel> _models;

  const Record(this._name, this._models);

  @override
  Widget build(BuildContext context) {
    final entries = _models.map((EntryModel model) {
      return Entry(model);
    });

    return Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.all(20),
          child: Text(this._name,
              style: TextStyle(color: Colors.blue, fontSize: 26))),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: entries.toList(),
          mainAxisSize: MainAxisSize.min)
    ]));
  }
}
