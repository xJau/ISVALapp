// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../single_stocks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleStocksModel _$SingleStocksModelFromJson(Map<String, dynamic> json) {
  return SingleStocksModel(
    singleStocks: (json['getdetailedstock'] as List<dynamic>)
        .map((e) => SingleStock.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SingleStocksModelToJson(SingleStocksModel instance) =>
    <String, dynamic>{
      'getdetailedstock': instance.singleStocks,
    };
