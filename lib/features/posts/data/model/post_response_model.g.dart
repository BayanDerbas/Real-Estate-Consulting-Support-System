// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponseModel _$PostResponseModelFromJson(Map<String, dynamic> json) =>
    PostResponseModel(
      status: json['status'] as String?,
      data:
          json['data'] == null
              ? null
              : PostData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostResponseModelToJson(PostResponseModel instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

PostData _$PostDataFromJson(Map<String, dynamic> json) => PostData(
  id: (json['id'] as num?)?.toInt(),
  expert:
      json['expert'] == null
          ? null
          : Expert.fromJson(json['expert'] as Map<String, dynamic>),
  content: json['content'] as String?,
  imageUrl: json['imageUrl'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$PostDataToJson(PostData instance) => <String, dynamic>{
  'id': instance.id,
  'expert': instance.expert,
  'content': instance.content,
  'imageUrl': instance.imageUrl,
  'createdAt': instance.createdAt,
};

Expert _$ExpertFromJson(Map<String, dynamic> json) => Expert(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['userId'] as num?)?.toInt(),
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  profession: json['profession'] as String?,
  experience: json['experience'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
  rateCount: (json['rateCount'] as num?)?.toInt(),
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$ExpertToJson(Expert instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'profession': instance.profession,
  'experience': instance.experience,
  'rating': instance.rating,
  'rateCount': instance.rateCount,
  'imageUrl': instance.imageUrl,
};
