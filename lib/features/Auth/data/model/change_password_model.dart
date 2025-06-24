// lib/features/Auth/data/model/change_password_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'change_password_model.g.dart';

@JsonSerializable()
class ChangePasswordModel {
  final String password;
  final String email;

  ChangePasswordModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);
  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);
}
