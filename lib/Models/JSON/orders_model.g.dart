// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) {
  return OrdersModel(
    totalOrders: (json['getorders'] as List<dynamic>)
        .map((e) => SingleOrderModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrdersModelToJson(OrdersModel instance) =>
    <String, dynamic>{
      'gettotalorders': instance.totalOrders,
    };
