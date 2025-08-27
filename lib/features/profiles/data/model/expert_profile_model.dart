import 'package:json_annotation/json_annotation.dart';

part 'expert_profile_model.g.dart';

@JsonSerializable()
class ExpertProfileModel {
  final String? status;
  final ExpertProfileData? data;

  ExpertProfileModel({this.status, this.data});

  factory ExpertProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ExpertProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExpertProfileModelToJson(this);
}

@JsonSerializable()
class ExpertProfileData {
  final int? id;
  final ExpertSelfData? user;
  final String? profession;
  final String? experience;
  final double? rating;
  final int? rateCount;
  final String? bio;
  final String? idCardImage;
  final String? degreeCertificateImage;
  final int? perMinuteVideo;
  final int? perMinuteAudio;
  final int? followersCount;
  final int? favoritesCount;
  final bool? newExpert;

  ExpertProfileData({
    this.id,
    this.user,
    this.profession,
    this.experience,
    this.rating,
    this.rateCount,
    this.bio,
    this.idCardImage,
    this.degreeCertificateImage,
    this.perMinuteVideo,
    this.perMinuteAudio,
    this.followersCount,
    this.favoritesCount,
    this.newExpert,
  });

  factory ExpertProfileData.fromJson(Map<String, dynamic> json) =>
      _$ExpertProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$ExpertProfileDataToJson(this);
}

@JsonSerializable()
class ExpertSelfData {
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

  ExpertSelfData({
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

  factory ExpertSelfData.fromJson(Map<String, dynamic> json) =>
      _$ExpertSelfDataFromJson(json);
  Map<String, dynamic> toJson() => _$ExpertSelfDataToJson(this);
}
