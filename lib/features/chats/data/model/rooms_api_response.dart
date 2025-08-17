import 'package:json_annotation/json_annotation.dart';

import 'rooms_of_current_user.dart';

part 'rooms_api_response.g.dart';

@JsonSerializable()
class RoomsApiResponse {
  final String? status;
  final List<RoomsOfCurrentUser>? data;

  RoomsApiResponse({this.status, this.data});

  factory RoomsApiResponse.fromJson(Map<String, dynamic> json) =>
      _$RoomsApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsApiResponseToJson(this);
}
