import 'package:json_annotation/json_annotation.dart';
import 'expert.dart';

part 'expert_response.g.dart';

@JsonSerializable()
class ExpertResponse {
  final String? status;
  final ExpertData? data;

  ExpertResponse({this.status, this.data});

  factory ExpertResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpertResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ExpertResponseToJson(this);
}

@JsonSerializable()
class ExpertByIdResponse {
  final String status;
  final Expert data;

  ExpertByIdResponse({required this.status, required this.data});

  factory ExpertByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpertByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertByIdResponseToJson(this);
}

@JsonSerializable()
class ExpertData {
  @JsonKey(defaultValue: [])
  final List<Expert>? content;

  final bool? last;
  final int? totalElements;

  ExpertData({this.content, this.last, this.totalElements});

  factory ExpertData.fromJson(Map<String, dynamic> json) =>
      _$ExpertDataFromJson(json);

  // factory ExpertData.fromJson(Map<String, dynamic> json) {
  // return ExpertData(
  //   content:
  //       (json['content'] as List<dynamic>?)
  //           ?.map((e) => Expert.fromJson(e as Map<String, dynamic>))
  //           .toList() ??
  //       [],
  // );
  // }

  Map<String, dynamic> toJson() => _$ExpertDataToJson(this);
}
