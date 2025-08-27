// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficeProfileModel _$OfficeProfileModelFromJson(Map<String, dynamic> json) =>
    OfficeProfileModel(
      status: json['status'] as String?,
      data:
          json['data'] == null
              ? null
              : OfficeProfileData.fromJson(
                json['data'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$OfficeProfileModelToJson(OfficeProfileModel instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

OfficeProfileData _$OfficeProfileDataFromJson(Map<String, dynamic> json) =>
    OfficeProfileData(
      id: (json['id'] as num?)?.toInt(),
      user:
          json['user'] == null
              ? null
              : OfficeSelfData.fromJson(json['user'] as Map<String, dynamic>),
      bio: json['bio'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      rateCount: (json['rateCount'] as num?)?.toInt(),
      location: json['location'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      commercialRegisterImage: json['commercialRegisterImage'] as String?,
    );

Map<String, dynamic> _$OfficeProfileDataToJson(OfficeProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'bio': instance.bio,
      'rating': instance.rating,
      'rateCount': instance.rateCount,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'commercialRegisterImage': instance.commercialRegisterImage,
    };

OfficeSelfData _$OfficeSelfDataFromJson(Map<String, dynamic> json) =>
    OfficeSelfData(
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

Map<String, dynamic> _$OfficeSelfDataToJson(OfficeSelfData instance) =>
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
