import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'total_stock.g.dart';



@JsonSerializable()
class TotalStock{
  
    TotalStock({
      required this.wip,
      required this.stockIta,
      required this.stockTrtoUs,
      required this.stockUs,
      required this.stockTrtoYou,
      required this.consignment
      });

    @JsonKey(name:'xeswip')
    final int wip;
    @JsonKey(name:'xesita')
    final int stockIta;
    @JsonKey(name:'xesvia')
    final int stockTrtoUs;
    @JsonKey(name:'xesusa')
    final int stockUs;
    @JsonKey(name:'xestcu')
    final int stockTrtoYou;
    @JsonKey(name:'xescns')
    final int consignment;

    factory TotalStock.fromJson(Map<String,dynamic> json) => _$TotalStockFromJson(json);

    Map<String, dynamic> toJson() => _$TotalStockToJson(this); 

}