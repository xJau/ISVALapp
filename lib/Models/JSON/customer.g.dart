// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    code: json['customerCode'] as String,
    name: json['customerName'] as String,
    category: _$enumDecode(_$CustomerCategoryEnumMap, json['customerCategory']),
    reference: json['customerReference'] as String,
    nation: json['customerNation'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'customerCode': instance.code,
      'customerName': instance.name,
      'customerCategory': _$CustomerCategoryEnumMap[instance.category],
      'customerReference': instance.reference,
      'customerNation': instance.nation,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$CustomerCategoryEnumMap = {
  CustomerCategory.A1: 'A1',
  CustomerCategory.A2: 'A2',
  CustomerCategory.A4: 'A4',
};
