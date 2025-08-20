import 'package:json_annotation/json_annotation.dart';
import 'faqs_data_model.dart';

part 'faqs_response_model.g.dart';
@JsonSerializable()
class FAQsResponse {
  final String? success;
  final FAQsData? data;

  FAQsResponse({this.success, this.data});
  factory FAQsResponse.fromJson(Map<String,dynamic> json) => _$FAQsResponseFromJson(json);
  Map<String,dynamic> toJson() => _$FAQsResponseToJson(this);
}