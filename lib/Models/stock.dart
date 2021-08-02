import 'package:flutter/cupertino.dart';
import 'package:isval_test/Models/total_stock.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';

@JsonSerializable()
class Stock {
  @JsonKey(name: 'gettotalstock')
  List<TotalStock> totalStocks;
  // @JsonKey(name:'errorMessage')
  // String errorMessage;

  Stock({
    required this.totalStocks,
    // required this.errorMessage
  });

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  Map<String, dynamic> toJson() => _$StockToJson(this);
}
