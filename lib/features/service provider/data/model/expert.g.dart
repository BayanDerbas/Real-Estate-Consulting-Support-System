// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expert _$ExpertFromJson(Map<String, dynamic> json) => Expert(
  id: (json['id'] as num).toInt(),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  profession: json['profession'] as String,
  experience: json['experience'] as String,
  rating: (json['rating'] as num).toDouble(),
  rateCount: (json['rateCount'] as num).toDouble(),
  bio: json['bio'] as String?,
  idCardImage: json['idCardImage'] as String,
  degreeCertificateImage: json['degreeCertificateImage'] as String,
  perMinuteVideo: (json['perMinuteVideo'] as num?)?.toDouble(),
  perMinuteAudio: (json['perMinuteAudio'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ExpertToJson(Expert instance) => <String, dynamic>{
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
};
