import 'package:json_annotation/json_annotation.dart';

part 'propertyImage_model.g.dart';

@JsonSerializable()
class PropertyImageModel {
  final int id;
  final String imageUrl;
  final String type;

  PropertyImageModel({
    required this.id,
    required this.imageUrl,
    required this.type,
  });

  factory PropertyImageModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyImageModelToJson(this);
}
