import 'package:json_annotation/json_annotation.dart';
import 'package:graduation_project/features/properties/data/model/propertyImage_model.dart'; // Adjust import path

part 'property_images_response.g.dart';

@JsonSerializable()
class PropertyImageResponse {
  final String status;
  final PropertyImageModel data;

  PropertyImageResponse({required this.status, required this.data});

  factory PropertyImageResponse.fromJson(Map<String, dynamic> json) =>
      _$PropertyImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyImageResponseToJson(this);
}
