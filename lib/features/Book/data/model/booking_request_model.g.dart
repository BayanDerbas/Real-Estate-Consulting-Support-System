// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) =>
    BookingRequest(
      expertId: (json['expertId'] as num).toInt(),
      clientId: (json['clientId'] as num).toInt(),
      callType: json['callType'] as String,
      duration: (json['duration'] as num).toInt(),
      startDate: json['startDate'] as String,
      clientSecret: json['clientSecret'] as String,
      couponCode: json['couponCode'] as String?,
    );

Map<String, dynamic> _$BookingRequestToJson(BookingRequest instance) =>
    <String, dynamic>{
      'expertId': instance.expertId,
      'clientId': instance.clientId,
      'callType': instance.callType,
      'duration': instance.duration,
      'startDate': instance.startDate,
      'couponCode': instance.couponCode,
      'clientSecret': instance.clientSecret,
    };
