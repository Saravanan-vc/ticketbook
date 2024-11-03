// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepatureModel _$DepatureModelFromJson(Map<String, dynamic> json) =>
    DepatureModel(
      airport: json['airport'] as String?,
      city: json['city'] as String?,
      gate: json['gate'] as String?,
      terminal: json['terminal'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$DepatureModelToJson(DepatureModel instance) =>
    <String, dynamic>{
      'airport': instance.airport,
      'city': instance.city,
      'time': instance.time,
      'terminal': instance.terminal,
      'gate': instance.gate,
    };
