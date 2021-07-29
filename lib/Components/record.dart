import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isval_test/Components/entry.dart';
import 'package:isval_test/Models/entry_model.dart';

class Record extends StatelessWidget {

  String _name;
  List<EntryModel> _models;

  Record(this._name,this._models);

  @override
  Widget build(BuildContext context) {
    final entries = _models.map(
    (EntryModel model) {
      return Entry(model);
    }
    );
  
    return Card( 

              child: Column(
                children: entries.toList()
              ),

              );
          
  }
}