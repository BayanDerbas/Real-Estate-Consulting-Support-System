import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginRequestModel {
  final String? email;
  final String? password;

  LoginRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}

@JsonSerializable()
class LoginResponseModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final bool? enabled;
  final String? role;
  final String? status;
  final String? imageUrl;
  final String? token;
  final String? refreshToken;

  LoginResponseModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.enabled,
    this.role,
    this.status,
    this.imageUrl,

    this.token,
    this.refreshToken,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
