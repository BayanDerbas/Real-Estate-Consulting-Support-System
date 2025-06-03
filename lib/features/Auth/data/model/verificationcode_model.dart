import 'package:json_annotation/json_annotation.dart';

part 'verificationcode_model.g.dart';

@JsonSerializable()
class VerificationCodeModel {
  final String? verificationCode;
  final String? email;
  VerificationCodeModel({required this.email, required this.verificationCode});
  factory VerificationCodeModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationCodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$VerificationCodeModelToJson(this);
}
