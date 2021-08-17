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

  /// Client's order reference
  final String xnraex;

  /// Isval order reference
  final String xnurif;

  ///Client article code
  final String xnrane;

  ///Isval article code
  final String xcodar;

  ///Estimated delivery date
  final String xdrcon;

  ///Nominal order quantity
  final int xnumer;

  ///Shipped order quantity
  final int xnumbu;

  ///Order total
  final int xsnume;

  factory SingleOrderModel.fromJson(Map<String, dynamic> json) =>
      _$SingleOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SingleOrderModelToJson(this);

  @override
  Map<String, String> getAttributesA2() {
    return {
      "PURCHASE ORDER": "$xnraex",
      //"xnurif": "$xnurif",
      //"xnrane": "$xnrane",
      //"xcodar": "$xcodar",
      "ETA": "$xdrcon",
      "ORDER QUANTITY": "$xnumer",
      "SHIPPED QUANTITY": "$xnumbu",
      "OPEN QUANTITY": "$xsnume",
    };
  }

  @override
  String getRecordName() {
    return xnrane;
  }

  @override
  Map<String, String> getAttributesA1() {
    // TODO: implement getAttributesA1
    throw UnimplementedError();
  }

  @override
  Map<String, String> getAttributesA4() {
    // TODO: implement getAttributesA4
    throw UnimplementedError();
  }

}
