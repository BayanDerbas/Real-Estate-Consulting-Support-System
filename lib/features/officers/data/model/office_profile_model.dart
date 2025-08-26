import 'package:json_annotation/json_annotation.dart';

part 'office_profile_model.g.dart';

@JsonSerializable()
class OfficeProfileModel {
  final String? status;
  final ResponseOfficeProfileData? data;

  OfficeProfileModel({this.status, this.data});

  factory OfficeProfileModel.fromJson(Map<String, dynamic> json) =>
      _$OfficeProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeProfileModelToJson(this);
}

@JsonSerializable()
class ResponseOfficeProfileData {
  final int? id;
  final OfficeProfileUser? user;
  final String? bio;
  final double? rating;
  final int? rateCount;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? commercialRegisterImage;

  ResponseOfficeProfileData({
    this.id,
    this.user,
    this.bio,
    this.rating,
    this.rateCount,
    this.location,
    this.latitude,
    this.longitude,
    this.commercialRegisterImage,
  });

  factory ResponseOfficeProfileData.fromJson(Map<String, dynamic> json) =>
      _$ResponseOfficeProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseOfficeProfileDataToJson(this);
}

@JsonSerializable()
class OfficeProfileUser {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? fcmToken;
  final bool? enabled;
  final String? role;
  final String? status;
  final String? imageUrl;
  final int? warnsCount;
  final int? blocksCount;

  OfficeProfileUser({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.fcmToken,
    this.enabled,
    this.role,
    this.status,
    this.imageUrl,
    this.warnsCount,
    this.blocksCount,
  });

  factory OfficeProfileUser.fromJson(Map<String, dynamic> json) =>
      _$OfficeProfileUserFromJson(json);

  Map<String, dynamic> toJson() => _$OfficeProfileUserToJson(this);
}
