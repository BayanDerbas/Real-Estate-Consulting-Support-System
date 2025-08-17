// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomsApiResponse _$RoomsApiResponseFromJson(Map<String, dynamic> json) =>
    RoomsApiResponse(
      status: json['status'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map(
                (e) => RoomsOfCurrentUser.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$RoomsApiResponseToJson(RoomsApiResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
