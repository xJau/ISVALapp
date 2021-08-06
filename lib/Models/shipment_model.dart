import 'package:json_annotation/json_annotation.dart';
import 'package:isval_test/Models/shipment.dart';

part 'JSON/shipment_model.g.dart';

@JsonSerializable()
class ShipmentModel {

  @JsonKey(name: 'getshipmentstocustomerlist')
  List<Shipment> shipments;

  ShipmentModel({
    required this.shipments,
  });

  factory ShipmentModel.fromJson(Map<String, dynamic> json) => _$ShipmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentModelToJson(this);
}
