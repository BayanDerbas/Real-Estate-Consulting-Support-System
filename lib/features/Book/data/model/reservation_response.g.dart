// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationResponse _$ReservationResponseFromJson(Map<String, dynamic> json) =>
    ReservationResponse(
      status: json['status'] as String,
      data: ReservationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReservationResponseToJson(
  ReservationResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

ReservationData _$ReservationDataFromJson(Map<String, dynamic> json) =>
    ReservationData(
      id: (json['id'] as num).toInt(),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );

Map<String, dynamic> _$ReservationDataToJson(ReservationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
