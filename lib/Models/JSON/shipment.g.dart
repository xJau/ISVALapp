// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shipment _$ShipmentFromJson(Map<String, dynamic> json) {
  return Shipment(
    cusCod: json['xcodic'] as String,
    shipNum: json['xnumsp'] as String,
    isvalNum: json['xnurif'] as String,
    cusOrdNum: json['xnraex'] as String,
    isvalItemCod: json['xcodar'] as String,
    cusItemCod: json['xnrane'] as int,
    tripCod: json['xitcode'] as String,
    quantity: json['xnumer'] as int,
    mezzo: json['xmezzo'] as String,
    vetCode: json['xvetto'] as String,
    vetURL: json['xveturl'] as String,
    mezds: json['xmezds'] as String,
    trackCod: json['xtrack'] as String,
    etaUSA: json['xetatw'] as String,
    etaDel: json['xdlvry'] as String,
    vetDesc: json['xvetds'] as String,
  );
}

Map<String, dynamic> _$ShipmentToJson(Shipment instance) => <String, dynamic>{
      'xcodic': instance.cusCod,
      'xnumsp': instance.shipNum,
      'xnurif': instance.isvalNum,
      'xnraex': instance.cusOrdNum,
      'xcodar': instance.isvalItemCod,
      'xnrane': instance.cusItemCod,
      'xitcode': instance.tripCod,
      'xnumer': instance.quantity,
      'xmezzo': instance.mezzo,
      'xmezds': instance.mezds,
      'xvetto': instance.vetCode,
      'xvetds': instance.vetDesc,
      'xveturl': instance.vetURL,
      'xtrack': instance.trackCod,
      'xetatw': instance.etaUSA,
      'xdlvry': instance.etaDel,
    };
