import 'package:json_annotation/json_annotation.dart';

part 'office_profile_model.g.dart';

@JsonSerializable()
class OfficeProfileModel {
  final String? status;
  final OfficeProfileData? data;

  OfficeProfileModel({this.status, this.data});

  factory OfficeProfileModel.fromJson(Map<String, dynamic> json) =>
      _$OfficeProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeProfileModelToJson(this);
}

@JsonSerializable()
class OfficeProfileData {
  final int? id;
  final OfficeSelfData? user;
  final String? bio;
  final double? rating;
  final int? rateCount;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? commercialRegisterImage;

  OfficeProfileData({
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

  factory OfficeProfileData.fromJson(Map<String, dynamic> json) =>
      _$OfficeProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeProfileDataToJson(this);
}

@JsonSerializable()
class OfficeSelfData {
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

  OfficeSelfData({
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

  factory OfficeSelfData.fromJson(Map<String, dynamic> json) =>
      _$OfficeSelfDataFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeSelfDataToJson(this);
}
