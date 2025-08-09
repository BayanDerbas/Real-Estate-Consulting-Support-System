// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) =>
    BookingResponse(
      status: json['status'] as String,
      data:
          json['data'] == null
              ? null
              : BookingData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingResponseToJson(BookingResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};
