import 'package:isval_test/Models/shipment_us.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JSON/shipment_us_model.g.dart';

@JsonSerializable()
class ShipmentToUsModel {
  @JsonKey(name: 'getshipmentstous')
  List<ShipmentToUs> shipmentsToUs;

  ShipmentToUsModel({
    required this.shipmentsToUs,
  });

  factory ShipmentToUsModel.fromJson(Map<String, dynamic> json) =>
      _$ShipmentToUsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentToUsModelToJson(this);
}
