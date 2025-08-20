// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQCategory _$FAQCategoryFromJson(Map<String, dynamic> json) => FAQCategory(
  (json['id'] as num?)?.toInt(),
  json['name'] as String?,
  json['createdAt'] as String?,
);

Map<String, dynamic> _$FAQCategoryToJson(FAQCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
    };
