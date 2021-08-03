// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../single_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleOrderModel _$SingleOrderModelFromJson(Map<String, dynamic> json) {
  return SingleOrderModel(
    xnraex: json['xnraex'] as String,
    xnurif: json['xnurif'] as String,
    xnrane: json['xnrane'] as String,
    xcodar: json['xcodar'] as String,
    xdrcon: json['xdrcon'] as String,
    xnumer: json['xnumer'] as int,
    xnumbu: json['xnumbu'] as int,
    xsnume: json['xsnume'] as int,
  );
}

Map<String, dynamic> _$SingleOrderModelToJson(SingleOrderModel instance) =>
    <String, dynamic>{
      'xnraex': instance.xnraex,
      'xnurif': instance.xnurif,
      'xnrane': instance.xnrane,
      'xcodar': instance.xcodar,
      'xdrcon': instance.xdrcon,
      'xnumer': instance.xnumer,
      'xnumbu': instance.xnumbu,
      'xsnume': instance.xsnume,
    };
