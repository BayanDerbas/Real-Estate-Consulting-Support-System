// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Office _$OfficeFromJson(Map<String, dynamic> json) => Office(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  imageUrl: json['imageUrl'] as String?,
  user:
      json['user'] == null
          ? null
          : UserOffice.fromJson(json['user'] as Map<String, dynamic>),
  bio: json['bio'] as String?,
  location: json['location'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  commercialRegisterImage: json['commercialRegisterImage'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  rateCount: (json['rateCount'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'imageUrl': instance.imageUrl,
  'user': instance.user,
  'bio': instance.bio,
  'location': instance.location,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'commercialRegisterImage': instance.commercialRegisterImage,
  'rateCount': instance.rateCount,
  'rating': instance.rating,
};
