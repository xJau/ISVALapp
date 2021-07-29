import 'package:flutter/cupertino.dart';
import 'package:isval_test/Models/entry_model.dart';

class Entry extends StatelessWidget {


  EntryModel _model;
  Entry(this._model);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(_model.name),
      Text(_model.value),
    ],
    );
  }

}