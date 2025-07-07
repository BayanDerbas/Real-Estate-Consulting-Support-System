// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propertyImage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyImageModel _$PropertyImageModelFromJson(Map<String, dynamic> json) =>
    PropertyImageModel(
      id: (json['id'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$PropertyImageModelToJson(PropertyImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'type': instance.type,
    };
