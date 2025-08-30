// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_me_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMeClient _$GetMeClientFromJson(Map<String, dynamic> json) => GetMeClient(
  status: json['status'] as String?,
  data: GetMeResponse.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetMeClientToJson(GetMeClient instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
