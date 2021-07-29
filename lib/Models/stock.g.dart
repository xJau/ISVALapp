// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) {
  return Stock(
    totalStocks: (json['gettotalstock'] as List<dynamic>)
        .map((e) => TotalStock.fromJson(e as Map<String, dynamic>))
        .toList(),
    // errorMessage: json['errorMessage'] as String,
  );
}

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'gettotalstock': instance.totalStocks,
      // 'errorMessage': instance.errorMessage,
    };
