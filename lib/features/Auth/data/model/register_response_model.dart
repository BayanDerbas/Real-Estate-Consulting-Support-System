import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  final String? status;
  final UserRegisterData? data;

  RegisterResponseModel({this.status, this.data});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}

@JsonSerializable()
class UserRegisterData {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final int? warnsCount;
  final int? blocksCount;

  UserRegisterData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.warnsCount,
    this.blocksCount,
  });

  factory UserRegisterData.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterDataToJson(this);
}
