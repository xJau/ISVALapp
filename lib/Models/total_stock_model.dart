import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Models/total_stock.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JSON/stock.g.dart';

@JsonSerializable()
class Stock {
  @JsonKey(name: 'gettotalstock')
  List<TotalStock> totalStocks;

  Stock({
    required this.totalStocks,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  Map<String, dynamic> toJson() => _$StockToJson(this);
}
