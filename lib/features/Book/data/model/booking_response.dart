import 'package:json_annotation/json_annotation.dart';
import 'booking_data_model.dart';

part 'booking_response.g.dart';

@JsonSerializable()
class BookingResponse {
  final String status;
  final BookingData? data;

  BookingResponse({required this.status, required this.data});

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    print("Raw response data: ${json['data']}");
    print("Data runtimeType: ${json['data']?.runtimeType}");

    return BookingResponse(
      status: json['status'] as String,
      data: (json['data'] != null && json['data'] is Map<String, dynamic>)
          ? BookingData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => _$BookingResponseToJson(this);
}
