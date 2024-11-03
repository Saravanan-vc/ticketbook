// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arrival_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArrivalModel _$ArrivalModelFromJson(Map<String, dynamic> json) => ArrivalModel(
      airport: json['airport'] as String?,
      city: json['city'] as String?,
      gate: json['gate'] as String?,
      terminal: json['terminal'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$ArrivalModelToJson(ArrivalModel instance) =>
    <String, dynamic>{
      'airport': instance.airport,
      'city': instance.city,
      'time': instance.time,
      'terminal': instance.terminal,
      'gate': instance.gate,
    };
