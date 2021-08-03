import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JSON/single_stock.g.dart';

@JsonSerializable()
class SingleStock implements IRecord {
  SingleStock({
    required this.xcodic,
    required this.xcodar,
    required this.xnrane,
    required this.xeswip,
    required this.xesita,
    required this.xesvia,
    required this.xesusa,
    required this.xestcu,
    required this.xescns,
    required this.xacL03,
  });

  /// Client code
  final String xcodic;

  /// ISVAL article code
  final String xcodar;

  /// Client article code
  final String xnrane;

  /// WIP stock
  final int xeswip;

  /// Italian warehouse stock
  final int xesita;

  /// In transit to US warehouse
  final int xesvia;

  /// American warehouse stock
  final int xesusa;

  /// In transit to client
  final int xestcu;

  /// Stock in consignment
  final int xescns;

  /// Art. 3 classifier
  final String xacL03;

  factory SingleStock.fromJson(Map<String, dynamic> json) =>
      _$SingleStockFromJson(json);

  Map<String, dynamic> toJson() => _$SingleStockToJson(this);

  @override
  Map<String, String> getAttributes() {
    return {
      //"xcodic": "$xcodic",
      //"xcodar": "$xcodar",
      "WIP": "$xeswip",
      "STOCK IN ITALY": "$xesita",
      "IN TRANSIT TO THE US": "$xesvia",
      "STOCK IN THE US": "$xesusa",
      "IN TRANSIT TO YOU": "$xestcu",
      "CONSIGNMENT": "$xescns",
      //"xacL03": "$xacL03",
    };
  }

  @override
  String getRecordName() {
    return xnrane;
  }
}
