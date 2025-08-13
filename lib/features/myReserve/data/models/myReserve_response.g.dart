// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myReserve_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyReserveResponse _$MyReserveResponseFromJson(Map<String, dynamic> json) =>
    MyReserveResponse(
      json['status'] as String,
      (json['data'] as List<dynamic>?)
          ?.map((e) => BookingData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyReserveResponseToJson(MyReserveResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
