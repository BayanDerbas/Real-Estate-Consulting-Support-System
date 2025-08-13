import 'package:json_annotation/json_annotation.dart';

part 'booking_request_model.g.dart';

@JsonSerializable()
class BookingRequest {
  final int expertId;
  final int clientId;
  final String callType;
  final int duration;
  final String startDate;
  final String? couponCode;
  final String clientSecret;

  BookingRequest({
    required this.expertId,
    required this.clientId,
    required this.callType,
    required this.duration,
    required this.startDate,
    required this.clientSecret,
    this.couponCode,
  });

  factory BookingRequest.fromJson(Map<String, dynamic> json) => _$BookingRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BookingRequestToJson(this);
}