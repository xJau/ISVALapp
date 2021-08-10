import 'package:flutter/material.dart';
import 'package:isval_test/Models/entry_model.dart';
import 'package:isval_test/Utility/colorpalette.dart';

class StockBox extends StatelessWidget {
  late EntryModel _entry;

  StockBox(this._entry);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: 117,
        height: 117,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Colorpalette.AZZURRO_1, Colorpalette.AZZURRO_3],
            stops: [0.0008194930069930072, 0.9992897727272727],
            begin: Alignment(-0.71, -0.71),
            end: Alignment(0.71, 0.71),
            // angle: 135,
            // scale: undefined,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _entry.value,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colorpalette.BIANCO, fontSize: 30),
              ),
              Text(
                _entry.name,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colorpalette.BIANCO, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
