import 'package:json_annotation/json_annotation.dart';

part 'reservation_response.g.dart';

@JsonSerializable()
class ReservationResponse {
  final String status;
  final ReservationData data;

  ReservationResponse({required this.status, required this.data});

  factory ReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$ReservationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationResponseToJson(this);
}

@JsonSerializable()
class ReservationData {
  final int id;
  final String startTime;
  final String endTime;

  ReservationData({
    required this.id,
    required this.startTime,
    required this.endTime,
  });

  factory ReservationData.fromJson(Map<String, dynamic> json) =>
      _$ReservationDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReservationDataToJson(this);
}
