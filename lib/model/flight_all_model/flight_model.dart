import 'package:json_annotation/json_annotation.dart';
import 'package:ticketbook/model/flight_all_model/arrival_model.dart';
import 'package:ticketbook/model/flight_all_model/depature_model.dart';

part 'flight_model.g.dart';

@JsonSerializable()
class FlightClass {
  @JsonKey(name: "flightId")
  String? flightId;

  @JsonKey(name: "flightNumber")
  String? flightNumber;

  @JsonKey(name: "airline")
  String? airline;

  @JsonKey(name: "departure")
  DepatureModel? departure;

  @JsonKey(name: "arrival")
  ArrivalModel? arrival;

  @JsonKey(name: "duration")
  String? duration;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "currency")
  String? currency;

  @JsonKey(name: "aircraftType")
  String? aircraftType;

  @JsonKey(name: "classOptions")
  List<String?>? classOptions;

  @JsonKey(name: "amenities")
  List<String?>? amenities;

  FlightClass(
      {this.aircraftType,
      this.airline,
      this.amenities,
      this.arrival,
      this.classOptions,
      this.currency,
      this.departure,
      this.duration,
      this.flightId,
      this.flightNumber,
      this.price});

  factory FlightClass.fromjson(Map<String, dynamic> json) =>
      _$FlightClassFromJson(json);

  Map<String, dynamic> json() => _$FlightClassToJson(this);

  @override
  String toString() {
   return 'FlightClass(flightId: $flightId, flightNumber: $flightNumber, airline: $airline, '
           'departure: ${departure?.city}, arrival: ${arrival?.city}, price: $price, '
           'duration: $duration, aircraftType: $aircraftType)';
  }
}