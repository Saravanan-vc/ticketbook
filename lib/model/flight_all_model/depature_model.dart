import 'package:json_annotation/json_annotation.dart';
part 'depature_model.g.dart';

@JsonSerializable()
class DepatureModel {
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
  DepatureModel({this.airport, this.city, this.gate, this.terminal, this.time});
  factory DepatureModel.fromjson(Map<String, dynamic> json) =>
      _$DepatureModelFromJson(json);

  Map<String, dynamic> json() => _$DepatureModelToJson(this);
}
