import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isval_test/Components/record_list.dart';
import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Services/api_service.dart';
import 'package:isval_test/Utility/colorpalette.dart';

class RecordListContainer extends StatefulWidget {
  late final RecordType type;
  RecordListContainer(this.type);
  @override
  _RecordListContainerState createState() => _RecordListContainerState();
}

class _RecordListContainerState extends State<RecordListContainer> {
  late Future<List<IRecord>> _model;
  @override
  void initState() {
    switch (widget.type) {
      case (RecordType.STOCK):
        _model = ApiService.getDetailedStocks("ACL002");
        break;
      case (RecordType.ORDERS):
        _model = ApiService.getOrders("ACL002");
        break;
      case (RecordType.SHIPMENTS):
        _model = ApiService.getShipments("ACL002");
        break;
      default:
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<IRecord>>(
        future: _model,
        builder: (BuildContext ctx, AsyncSnapshot<List<IRecord>> snap) {
          if (snap.hasData) {
            var data = snap.data;
            return RecordList(data!, widget.type);
          } else
            return SpinKitFadingCircle(
              itemBuilder: (ctx, idx) {
                return DecoratedBox(
                    decoration:
                        BoxDecoration(color: Colorpalette.AZZURRO_ISVAL));
              },
            );
        });
  }
}
