// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalStock _$TotalStockFromJson(Map<String, dynamic> json) {
  return TotalStock(
    wip: json['xeswip'] as int,
    stockIta: json['xesita'] as int,
    stockTrtoUs: json['xesvia'] as int,
    stockUs: json['xesusa'] as int,
    stockTrtoYou: json['xestcu'] as int,
    consignment: json['xescns'] as int,
  );
}

Map<String, dynamic> _$TotalStockToJson(TotalStock instance) =>
    <String, dynamic>{
      'xeswip': instance.wip,
      'xesita': instance.stockIta,
      'xesvia': instance.stockTrtoUs,
      'xesusa': instance.stockUs,
      'xestcu': instance.stockTrtoYou,
      'xescns': instance.consignment,
    };
