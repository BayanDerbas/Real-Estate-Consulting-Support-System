// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingData _$BookingDataFromJson(Map<String, dynamic> json) => BookingData(
  id: (json['id'] as num?)?.toInt(),
  client: customClientFromJson(json['client'] as Map<String, dynamic>?),
  expert: customExpertFromJson(json['expert'] as Map<String, dynamic>?),
  clientSecret: json['clientSecret'] as String?,
  callType: json['callType'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  originalPrice: (json['originalPrice'] as num?)?.toDouble(),
  discountAmount: (json['discountAmount'] as num?)?.toDouble(),
  finalPrice: (json['finalPrice'] as num?)?.toDouble(),
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
  bookingStatus: json['bookingStatus'] as String?,
  refundStatus: json['refundStatus'] as String?,
  scheduledAt: json['scheduled_at'] as String?,
  cancelledAt: json['cancelled_at'] as String?,
  cancelledBy: json['cancelled_by'] as String?,
  cancellationReason: json['cancellationReason'] as String?,
  feedback: json['feedback'] as String?,
);

Map<String, dynamic> _$BookingDataToJson(BookingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client': instance.client,
      'expert': instance.expert,
      'clientSecret': instance.clientSecret,
      'callType': instance.callType,
      'duration': instance.duration,
      'originalPrice': instance.originalPrice,
      'discountAmount': instance.discountAmount,
      'finalPrice': instance.finalPrice,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'bookingStatus': instance.bookingStatus,
      'refundStatus': instance.refundStatus,
      'scheduled_at': instance.scheduledAt,
      'cancelled_at': instance.cancelledAt,
      'cancelled_by': instance.cancelledBy,
      'cancellationReason': instance.cancellationReason,
      'feedback': instance.feedback,
    };
