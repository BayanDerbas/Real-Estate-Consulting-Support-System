import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  final String? email;
  final String? password;

  LoginModel({this.email, this.password});

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
