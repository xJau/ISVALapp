// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      id: json['id'] == null ? 'null' : json['id'],
      username: json['username'] == null ? 'null' : json['username'],
      firstName: json['firstName'] == null ? 'null' : json['firstName'],
      lastName: json['lastName'] == null ? 'null' : json['lastName'],
      email: json['email'] == null ? 'null' : json['email']
    );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'email': instance.email,
    };
