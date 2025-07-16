// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Office _$OfficeFromJson(Map<String, dynamic> json) => Office(
  id: (json['id'] as num).toInt(),
  user: UserOffice.fromJson(json['user'] as Map<String, dynamic>),
  bio: json['bio'] as String,
  location: json['location'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  commercialRegisterImage: json['commercialRegisterImage'] as String,
);

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user,
  'bio': instance.bio,
  'location': instance.location,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'commercialRegisterImage': instance.commercialRegisterImage,
};
