// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../shipment_us_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentToUsModel _$ShipmentToUsModelFromJson(Map<String, dynamic> json) {
  return ShipmentToUsModel(
    shipmentsToUs: (json['getshipmentstous'] as List<dynamic>)
        .map((e) => ShipmentToUs.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShipmentToUsModelToJson(ShipmentToUsModel instance) =>
    <String, dynamic>{
      'getshipmentstous': instance.shipmentsToUs,
    };
