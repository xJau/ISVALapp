import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  @JsonKey(name: 'customerCode')
  String code;
  @JsonKey(name: 'customerName')
  String name;
  @JsonKey(name: 'customerCategory')
  CustomerCategory category;
  @JsonKey(name: 'customerReference')
  String reference;
  @JsonKey(name: 'customerNation')
  String nation;

  Customer(
      {required this.code,
      required this.name,
      required this.category,
      required this.reference,
      required this.nation});

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

enum CustomerCategory { A1, A2, A4 }
