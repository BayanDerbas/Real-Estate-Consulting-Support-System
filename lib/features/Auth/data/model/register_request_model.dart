import 'dart:io'; // <-- Import this for the File type
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? phone;
  final String? role;
  final String? latitude;
  final String? longitude;
  final String? location;

  final String? profession;
  final String? experience;
  final String? bio;

  @JsonKey(ignore: true)
  final File? commercialRegisterImage;

  @JsonKey(ignore: true)
  final File? idCardImage;

  @JsonKey(ignore: true)
  final File? degreeCertificateImage;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.role,

    this.latitude,
    this.longitude,
    this.location,
    this.profession,
    this.experience,
    this.bio,
    this.commercialRegisterImage,
    this.idCardImage,
    this.degreeCertificateImage,
  });

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}
