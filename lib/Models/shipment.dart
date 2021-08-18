import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Interfaces/i_shipment_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'customer.dart';

part 'JSON/shipment.g.dart';

@JsonSerializable()
class Shipment implements IRecord, IShipmentModel {
  Shipment(
      {required this.cusCod,
      required this.shipNum,
      required this.isvalNum,
      required this.cusOrdNum,
      required this.isvalItemCod,
      required this.cusItemCod,
      required this.tripCod,
      required this.quantity,
      required this.mezzo,
      required this.vetCode,
      required this.vetURL,
      required this.mezds,
      required this.trackCod,
      required this.etaUSA,
      required this.etaDel,
      required this.vetDesc});

  @JsonKey(name: 'xcodic')
  final String cusCod;
  @JsonKey(name: 'xnumsp')
  final String shipNum;
  @JsonKey(name: 'xnurif')
  final String isvalNum;
  @JsonKey(name: 'xnraex')
  final String cusOrdNum;
  @JsonKey(name: 'xcodar')
  final String isvalItemCod;
  @JsonKey(name: 'xnrane')
  final String cusItemCod;
  @JsonKey(name: 'xitcode')
  final String tripCod;
  @JsonKey(name: 'xnumer')
  final int quantity;
  @JsonKey(name: 'xmezzo')
  final String mezzo;
  @JsonKey(name: 'xmezds')
  final String mezds;
  @JsonKey(name: 'xvetto')
  final String vetCode;
  @JsonKey(name: 'xvetds')
  final String vetDesc;
  @JsonKey(name: 'xveturl')
  final String vetURL;
  @JsonKey(name: 'xtrack')
  final String trackCod;
  @JsonKey(name: 'xetatw')
  final String etaUSA;
  @JsonKey(name: 'xdlvry')
  final String etaDel;

  factory Shipment.fromJson(Map<String, dynamic> json) =>
      _$ShipmentFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentToJson(this);

  @override
  Map<String, String> getAttributes(CustomerCategory category) {
    switch (category) {
      case CustomerCategory.A1:
        return {
          "QTY": "$quantity",
          "CARRIER": "$vetDesc",
          "TRACKING NUMBER": "$trackCod",
          "ETA TO US WAREHOUSE": "$etaUSA",
        };
      case CustomerCategory.A2:
        return {
          "PURCHASE ORDER": "$cusOrdNum",
          "QTY": "$quantity",
          "CARRIER": "$vetDesc",
          "TRACKING NUMBER": "$trackCod",
          "ETA": "$etaDel",
        };
      case CustomerCategory.A4:
        return {};
    }
  }

  @override
  String getRecordName() {
    return cusOrdNum;
    throw UnimplementedError();
  }

  @override
  String getShipmentType() {
    return mezds;
  }
}
