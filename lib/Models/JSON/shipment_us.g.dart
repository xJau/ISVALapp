// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../shipment_us.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentToUs _$ShipmentToUsFromJson(Map<String, dynamic> json) {
  return ShipmentToUs(
    cusCod: json['xcodic'] as String,
    isvalItemCod: json['xcodar'] as String,
    cusItemCod: json['xnrane'] as String,
    tripCod: json['xitcode'] as String,
    quantity: json['xnumer'] as int,
    mezzo: json['xmezzo'] as String,
    mezds: json['xmezds'] as String,
    vetCode: json['xvetto'] as String,
    vetURL: json['xveturl'] as String,
    trackCod: json['xtrack'] as String,
    etaUSA: json['xetatw'] as String,
    etaDel: json['xdlvry'] as String,
    vetDesc: json['xvetds'] as String,
    seaAir: json['xseair'] == 'S' ? true : false,
    port: json['xport'] == 'S' ? true : false,
    train: json['xtrain'] == 'S' ? true : false,
    warehouse: json['xwhouse'] == 'S' ? true : false,
  );
}

Map<String, dynamic> _$ShipmentToUsToJson(ShipmentToUs instance) =>
    <String, dynamic>{
      'xcodic': instance.cusCod,
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
      'xseair': instance.seaAir,
      'xport': instance.port,
      'xtrain': instance.train,
      'xwhouse': instance.warehouse,
      'xdlvry': instance.etaDel,
    };
