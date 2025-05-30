import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String? role;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    this.role,
  });

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}
