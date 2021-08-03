import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isval_test/Models/entry_model.dart';

class Entry extends StatelessWidget {
  final EntryModel _model;

  const Entry(this._model);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_model.name,
                style: TextStyle(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold)),
            SizedBox(height: 3),
            Text(_model.value),
            SizedBox(height: 20),
          ],
        ));
  }
}
