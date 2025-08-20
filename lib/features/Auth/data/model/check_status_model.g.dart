// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckStatusModel _$CheckStatusModelFromJson(Map<String, dynamic> json) =>
    CheckStatusModel(
      id: (json['id'] as num?)?.toInt(),
      userStatus: json['userStatus'] as String?,
    );

Map<String, dynamic> _$CheckStatusModelToJson(CheckStatusModel instance) =>
    <String, dynamic>{'id': instance.id, 'userStatus': instance.userStatus};
