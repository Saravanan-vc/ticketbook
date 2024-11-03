import 'package:json_annotation/json_annotation.dart';
part 'arrival_model.g.dart';

@JsonSerializable()
class ArrivalModel {
  @JsonKey(name: "airport")
  String? airport;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "terminal")
  String? terminal;
  @JsonKey(name: "gate")
  String? gate;
  ArrivalModel({this.airport, this.city, this.gate, this.terminal, this.time});
  factory ArrivalModel.fromjson(Map<String, dynamic> json) =>
      _$ArrivalModelFromJson(json);

  Map<String, dynamic> json() => _$ArrivalModelToJson(this);

  @override
  String toString() {
    return 'airport:$airport,city:$city,time:$time,terminal:$terminal,garte:$gate';
  }
}
