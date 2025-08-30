import 'package:json_annotation/json_annotation.dart';

part 'rating_response.g.dart';

@JsonSerializable()
class RatingResponse {
  final String status;
  final String data;

  RatingResponse({
    required this.status,
    required this.data,
  });

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RatingResponseToJson(this);
}
