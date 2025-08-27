// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertProfileModel _$ExpertProfileModelFromJson(Map<String, dynamic> json) =>
    ExpertProfileModel(
      status: json['status'] as String?,
      data:
          json['data'] == null
              ? null
              : ExpertProfileData.fromJson(
                json['data'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$ExpertProfileModelToJson(ExpertProfileModel instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

ExpertProfileData _$ExpertProfileDataFromJson(Map<String, dynamic> json) =>
    ExpertProfileData(
      id: (json['id'] as num?)?.toInt(),
      user:
          json['user'] == null
              ? null
              : ExpertSelfData.fromJson(json['user'] as Map<String, dynamic>),
      profession: json['profession'] as String?,
      experience: json['experience'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      rateCount: (json['rateCount'] as num?)?.toInt(),
      bio: json['bio'] as String?,
      idCardImage: json['idCardImage'] as String?,
      degreeCertificateImage: json['degreeCertificateImage'] as String?,
      perMinuteVideo: (json['perMinuteVideo'] as num?)?.toInt(),
      perMinuteAudio: (json['perMinuteAudio'] as num?)?.toInt(),
      followersCount: (json['followersCount'] as num?)?.toInt(),
      favoritesCount: (json['favoritesCount'] as num?)?.toInt(),
      newExpert: json['newExpert'] as bool?,
    );

Map<String, dynamic> _$ExpertProfileDataToJson(ExpertProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'profession': instance.profession,
      'experience': instance.experience,
      'rating': instance.rating,
      'rateCount': instance.rateCount,
      'bio': instance.bio,
      'idCardImage': instance.idCardImage,
      'degreeCertificateImage': instance.degreeCertificateImage,
      'perMinuteVideo': instance.perMinuteVideo,
      'perMinuteAudio': instance.perMinuteAudio,
      'followersCount': instance.followersCount,
      'favoritesCount': instance.favoritesCount,
      'newExpert': instance.newExpert,
    };

ExpertSelfData _$ExpertSelfDataFromJson(Map<String, dynamic> json) =>
    ExpertSelfData(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fcmToken: json['fcmToken'] as String?,
      enabled: json['enabled'] as bool?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      imageUrl: json['imageUrl'] as String?,
      warnsCount: (json['warnsCount'] as num?)?.toInt(),
      blocksCount: (json['blocksCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExpertSelfDataToJson(ExpertSelfData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'fcmToken': instance.fcmToken,
      'enabled': instance.enabled,
      'role': instance.role,
      'status': instance.status,
      'imageUrl': instance.imageUrl,
      'warnsCount': instance.warnsCount,
      'blocksCount': instance.blocksCount,
    };
