// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    authenticationToken:
        json['authenticationToken'] == null ? '' : json['authenticationToken'],
    id: json['id'] == null ? '' : json['id'],
    firstName: json['firstName'] == null ? '' : json['firstName'],
    lastName: json['lastName'] == null ? '' : json['lastName'],
    userName: json['userName'] == null ? '' : json['userName'],
    email: json['email'] == null ? '' : json['email'],
    role: json['roleName'] == null ? '' : json['roleName'],
    customers: (json['customers'] as List<dynamic>)
        .map((e) => Customer.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'authenticationToken': instance.authenticationToken,
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'email': instance.email,
      'roleName': instance.role,
      'customers': instance.customers
    };
