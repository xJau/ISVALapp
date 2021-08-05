import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JSON/total_stock.g.dart';

@JsonSerializable()
class TotalStock implements IRecord {
  TotalStock(
      {required this.wip,
      required this.stockIta,
      required this.stockTrtoUs,
      required this.stockUs,
      required this.stockTrtoYou,
      required this.consignment});

  @JsonKey(name: 'xeswip')
  final int wip;
  @JsonKey(name: 'xesita')
  final int stockIta;
  @JsonKey(name: 'xesvia')
  final int stockTrtoUs;
  @JsonKey(name: 'xesusa')
  final int stockUs;
  @JsonKey(name: 'xestcu')
  final int stockTrtoYou;
  @JsonKey(name: 'xescns')
  final int consignment;

  factory TotalStock.fromJson(Map<String, dynamic> json) =>
      _$TotalStockFromJson(json);

  Map<String, dynamic> toJson() => _$TotalStockToJson(this);

  @override
  Map<String, String> getAttributes() {
    return {
      "WIP": "$wip",
      "STOCK IN ITALY": "$stockIta",
      "IN TRANSIT TO THE US": "$stockTrtoUs",
      "STOCK IN THE US": "$stockUs",
      "IN TRANSIT TO YOU": "$stockTrtoYou",
      "CONSIGNMENT": "$consignment"
    };
  }

  @override
  String getRecordName() {
    // TODO: implement getRecordName
    throw UnimplementedError();
  }
}
