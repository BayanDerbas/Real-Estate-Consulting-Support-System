// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'office_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficeData _$OfficeDataFromJson(Map<String, dynamic> json) => OfficeData(
  content:
      (json['content'] as List<dynamic>?)
          ?.map((e) => Office.fromJson(e as Map<String, dynamic>))
          .toList(),
  pageable:
      json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
  totalPages: (json['totalPages'] as num?)?.toInt(),
);

Map<String, dynamic> _$OfficeDataToJson(OfficeData instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'totalPages': instance.totalPages,
    };

Pageable _$PageableFromJson(Map<String, dynamic> json) =>
    Pageable(pageNumber: (json['pageNumber'] as num?)?.toInt());

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
  'pageNumber': instance.pageNumber,
};
