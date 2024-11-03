// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightClass _$FlightClassFromJson(Map<String, dynamic> json) => FlightClass(
      aircraftType: json['aircraftType'] as String?,
      airline: json['airline'] as String?,
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      arrival: json['arrival'] == null
          ? null
          : ArrivalModel.fromjson(json['arrival'] as Map<String, dynamic>),
      classOptions: (json['classOptions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      currency: json['currency'] as String?,
      departure: json['departure'] == null
          ? null
          : DepatureModel.fromjson(json['departure'] as Map<String, dynamic>),
      duration: json['duration'] as String?,
      flightId: json['flightId'] as String?,
      flightNumber: json['flightNumber'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$FlightClassToJson(FlightClass instance) =>
    <String, dynamic>{
      'flightId': instance.flightId,
      'flightNumber': instance.flightNumber,
      'airline': instance.airline,
      'departure': instance.departure,
      'arrival': instance.arrival,
      'duration': instance.duration,
      'price': instance.price,
      'currency': instance.currency,
      'aircraftType': instance.aircraftType,
      'classOptions': instance.classOptions,
      'amenities': instance.amenities,
    };
