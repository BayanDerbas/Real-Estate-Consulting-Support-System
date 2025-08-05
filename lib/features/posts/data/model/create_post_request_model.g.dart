// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePostRequestModel _$CreatePostRequestModelFromJson(
  Map<String, dynamic> json,
) => CreatePostRequestModel(
  expertId: (json['expertId'] as num).toInt(),
  content: json['content'] as String,
);

Map<String, dynamic> _$CreatePostRequestModelToJson(
  CreatePostRequestModel instance,
) => <String, dynamic>{
  'expertId': instance.expertId,
  'content': instance.content,
};
