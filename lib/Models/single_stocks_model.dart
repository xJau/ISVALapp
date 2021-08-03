import 'package:isval_test/Models/single_stock.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JSON/single_stocks_model.g.dart';

@JsonSerializable()
class SingleStocksModel {
  @JsonKey(name: 'getdetailedstock')
  List<SingleStock> singleStocks;

  SingleStocksModel({
    required this.singleStocks,
  });

  factory SingleStocksModel.fromJson(Map<String, dynamic> json) =>
      _$SingleStocksModelFromJson(json);

  Map<String, dynamic> toJson() => _$SingleStocksModelToJson(this);
}
