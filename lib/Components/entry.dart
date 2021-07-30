import 'package:flutter/cupertino.dart';
import 'package:isval_test/Models/entry_model.dart';

class Entry extends StatelessWidget {
  final EntryModel _model;

  const Entry(this._model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_model.name),
        Text(_model.value),
      ],
    );
  }
}
