import 'package:isval_test/Models/single_order_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'JSON/orders_model.g.dart';

@JsonSerializable()
class OrdersModel {
  @JsonKey(name: 'getorders')
  late List<SingleOrderModel> totalOrders;

  OrdersModel({
    required this.totalOrders,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersModelToJson(this);
}
