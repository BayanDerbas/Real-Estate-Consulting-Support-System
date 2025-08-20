// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAQsData _$FAQsDataFromJson(Map<String, dynamic> json) => FAQsData(
  (json['content'] as List<dynamic>?)
      ?.map((e) => FAQItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  (json['pageNumber'] as num?)?.toInt(),
  (json['pageSize'] as num?)?.toInt(),
  json['last'] as bool?,
  (json['totalElements'] as num?)?.toInt(),
  (json['totalPages'] as num?)?.toInt(),
  json['first'] as bool?,
  (json['numberOfElements'] as num?)?.toInt(),
);

Map<String, dynamic> _$FAQsDataToJson(FAQsData instance) => <String, dynamic>{
  'content': instance.content,
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
  'last': instance.last,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'first': instance.first,
  'numberOfElements': instance.numberOfElements,
};
