// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyImageResponse _$PropertyImageResponseFromJson(
  Map<String, dynamic> json,
) => PropertyImageResponse(
  status: json['status'] as String,
  data: PropertyImageModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PropertyImageResponseToJson(
  PropertyImageResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
