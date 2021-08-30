import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Interfaces/i_shipment_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'customer.dart';

part 'JSON/shipment_us.g.dart';

@JsonSerializable()
class ShipmentToUs implements IRecord, IShipmentModel {
  ShipmentToUs(
      {required this.cusCod,
      required this.isvalItemCod,
      required this.cusItemCod,
      required this.tripCod,
      required this.quantity,
      required this.mezzo,
      required this.mezds,
      required this.vetCode,
      required this.vetURL,
      required this.trackCod,
      required this.etaUSA,
      required this.etaDel,
      required this.vetDesc,
      required this.seaAir,
      required this.port,
      required this.train,
      required this.warehouse});

  @JsonKey(name: 'xcodic')
  final String cusCod;
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
  @JsonKey(name: 'xseair')
  final bool seaAir;
  @JsonKey(name: 'xport')
  final bool port;
  @JsonKey(name: 'xtrain')
  final bool train;
  @JsonKey(name: 'xwhouse')
  final bool warehouse;
  @JsonKey(name: 'xdlvry')
  final String etaDel;

  factory ShipmentToUs.fromJson(Map<String, dynamic> json) =>
      _$ShipmentToUsFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentToUsToJson(this);

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
          "QTY": "$quantity",
          "CARRIER": "$vetDesc",
          "TRACKING NUMBER": "$trackCod",
          "ETA TO US WAREHOUSE": "$etaUSA",
        };
      case CustomerCategory.A4:
        return {};
    }
  }

  Map<String, bool> getShipmentStatus() {
    return {
      "MARE/AEREO": seaAir,
      "PORTO": port,
      "TRENO": train,
      "WAREHOUSE": warehouse,
    };
  }

  @override
  String getRecordName() {
    return isvalItemCod;
  }

  @override
  String getShipmentType() {
    return mezds;
  }
}
