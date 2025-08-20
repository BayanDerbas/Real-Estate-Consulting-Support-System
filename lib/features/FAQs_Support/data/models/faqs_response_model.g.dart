// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQsResponse _$FAQsResponseFromJson(Map<String, dynamic> json) => FAQsResponse(
  success: json['success'] as String?,
  data:
      json['data'] == null
          ? null
          : FAQsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FAQsResponseToJson(FAQsResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
