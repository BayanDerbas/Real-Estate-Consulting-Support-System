// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertPostsResponse _$ExpertPostsResponseFromJson(Map<String, dynamic> json) =>
    ExpertPostsResponse(
      status: json['status'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => ExpertPost.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ExpertPostsResponseToJson(
  ExpertPostsResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'data': instance.data?.map((e) => e.toJson()).toList(),
};

ExpertPost _$ExpertPostFromJson(Map<String, dynamic> json) => ExpertPost(
  id: (json['id'] as num?)?.toInt(),
  expert:
      json['expert'] == null
          ? null
          : Expert.fromJson(json['expert'] as Map<String, dynamic>),
  content: json['content'] as String?,
  imageUrl: json['imageUrl'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$ExpertPostToJson(ExpertPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expert': instance.expert?.toJson(),
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
