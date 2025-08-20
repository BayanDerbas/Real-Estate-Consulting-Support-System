// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsResponseModel _$PostsResponseModelFromJson(Map<String, dynamic> json) =>
    PostsResponseModel(
      status: json['status'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => PostsData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$PostsResponseModelToJson(PostsResponseModel instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

PostsData _$PostsDataFromJson(Map<String, dynamic> json) => PostsData(
  id: (json['id'] as num?)?.toInt(),
  expert:
      json['expert'] == null
          ? null
          : Expert.fromJson(json['expert'] as Map<String, dynamic>),
  content: json['content'] as String?,
  imageUrl: json['imageUrl'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$PostsDataToJson(PostsData instance) => <String, dynamic>{
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
  rating: (json['rating'] as num?)?.toDouble(),
  rateCount: (json['rateCount'] as num?)?.toDouble(),
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
