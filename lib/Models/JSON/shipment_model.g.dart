// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../shipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentModel _$ShipmentModelFromJson(Map<String, dynamic> json) {
  return ShipmentModel(
    shipments: (json['getshipmentstocustomer'] as List<dynamic>)
        .map((e) => Shipment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShipmentModelToJson(ShipmentModel instance) =>
    <String, dynamic>{
      'getshipmentstocustomer': instance.shipments,
    };
