import 'package:json_annotation/json_annotation.dart';

part 'model_user_auth.g.dart';

@JsonSerializable()
class ModelUserauth {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? password;
  ModelUserauth({this.name, this.email, this.password});

  factory ModelUserauth.fromJson(Map<String, dynamic> json) =>
      _$ModelUserauthFromJson(json);

  Map<String, dynamic> tjson() => _$ModelUserauthToJson(this);
}
