// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQItem _$FAQItemFromJson(Map<String, dynamic> json) => FAQItem(
  (json['id'] as num?)?.toInt(),
  json['question'] as String?,
  json['answer'] as String?,
  json['category'] == null
      ? null
      : FAQCategory.fromJson(json['category'] as Map<String, dynamic>),
  json['createdAt'] as String?,
);

Map<String, dynamic> _$FAQItemToJson(FAQItem instance) => <String, dynamic>{
  'id': instance.id,
  'question': instance.question,
  'answer': instance.answer,
  'category': instance.category,
  'createdAt': instance.createdAt,
};
