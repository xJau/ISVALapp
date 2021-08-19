import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:isval_test/Models/customer.dart';
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
  String getRecordName() {
    // TODO: implement getRecordName
    throw UnimplementedError();
  }

  @override
  Map<String, String> getAttributes(CustomerCategory category) {
    switch (category) {
      case CustomerCategory.A1:
        return {
          "STOCK IN ITALY": "$stockIta",
          "WIP": "$wip",
          "IN TRANSIT TO THE US": "$stockTrtoUs",
          "STOCK IN THE US": "$stockUs",
          "IN TRANSIT TO YOU": "$stockTrtoYou"
        };
      case CustomerCategory.A2:
        return {
          "STOCK IN ITALY": "$stockIta",
          "WIP": "$wip",
          "IN TRANSIT TO THE US": "$stockTrtoUs",
          "STOCK IN THE US": "$stockUs",
          "IN TRANSIT TO YOU": "$stockTrtoYou",
          "CONSIGNMENT": "$consignment"
        };
      case CustomerCategory.A4:
        return {
          "STOCK IN ITALY": "$stockIta",
          "WIP": "$wip",
        };
    }
  }
}
