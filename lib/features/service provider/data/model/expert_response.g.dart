// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertResponse _$ExpertResponseFromJson(Map<String, dynamic> json) =>
    ExpertResponse(
      status: json['status'] as String,
      data: ExpertData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExpertResponseToJson(ExpertResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

ExpertData _$ExpertDataFromJson(Map<String, dynamic> json) => ExpertData(
  content:
      (json['content'] as List<dynamic>)
          .map((e) => Expert.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ExpertDataToJson(ExpertData instance) =>
    <String, dynamic>{'content': instance.content};
