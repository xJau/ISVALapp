import 'package:isval_test/Interfaces/i_record_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JSON/single_order_model.g.dart';

@JsonSerializable()
class SingleOrderModel implements IRecord {
  SingleOrderModel({
    required this.xnraex,
    required this.xnurif,
    required this.xnrane,
    required this.xcodar,
    required this.xdrcon,
    required this.xnumer,
    required this.xnumbu,
    required this.xsnume,
  });

  final String xnraex;
  final String xnurif;
  final String xnrane;
  final String xcodar;
  final String xdrcon;
  final int xnumer;
  final int xnumbu;
  final int xsnume;

  factory SingleOrderModel.fromJson(Map<String, dynamic> json) =>
      _$SingleOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SingleOrderModelToJson(this);

  @override
  Map<String, String> getAttributes() {
    return {
      "xnraex": "$xnraex",
      "xnurif": "$xnurif",
      "xnrane": "$xnrane",
      "xcodar": "$xcodar",
      "xdrcon": "$xdrcon",
      "xnumbu": "$xnumbu",
      "xsnume": "$xsnume",
    };
  }

  @override
  String getRecordName() {
    return "";
  }
}
