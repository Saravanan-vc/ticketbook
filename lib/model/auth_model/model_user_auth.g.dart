// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_user_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelUserauth _$ModelUserauthFromJson(Map<String, dynamic> json) =>
    ModelUserauth(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$ModelUserauthToJson(ModelUserauth instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
