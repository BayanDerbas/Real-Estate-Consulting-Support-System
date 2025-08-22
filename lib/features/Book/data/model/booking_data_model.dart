import 'package:json_annotation/json_annotation.dart';
import '../../../service provider/data/model/expert.dart';
import '../../../ticket/data/model/publish_ticket_response_model.dart';

part 'booking_data_model.g.dart';

@JsonSerializable()
class BookingData {
  final int? id;

  @JsonKey(fromJson: customClientFromJson)
  final Client? client;

  @JsonKey(fromJson: customExpertFromJson)
  final Expert? expert;

  final String? clientSecret;
  final String? callType;
  final int? duration;
  final double? originalPrice;
  final double? discountAmount;
  final double? finalPrice;
  final String? startTime;
  final String? endTime;
  final String? bookingStatus;
  final String? refundStatus;
  @JsonKey(name: 'scheduled_at')
  final String? scheduledAt;
  @JsonKey(name: 'cancelled_at')
  final String? cancelledAt;
  @JsonKey(name: 'cancelled_by')
  final String? cancelledBy;
  final String? cancellationReason;
  final String? feedback;

  BookingData({
    required this.id,
    required this.client,
    required this.expert,
    required this.clientSecret,
    required this.callType,
    required this.duration,
    required this.originalPrice,
    required this.discountAmount,
    required this.finalPrice,
    required this.startTime,
    required this.endTime,
    required this.bookingStatus,
    this.refundStatus,
    this.scheduledAt,
    this.cancelledAt,
    this.cancelledBy,
    this.cancellationReason,
    this.feedback,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) =>
      _$BookingDataFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDataToJson(this);
}

Client? customClientFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return null;
  }
  return Client.fromJson(json);
}

Expert? customExpertFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return null;
  }
  return Expert.fromJson(json);
}
