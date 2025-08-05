import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'create_post_request_model.g.dart';

@JsonSerializable()
class CreatePostRequestModel {
  final int expertId;
  final String content;

  @JsonKey(ignore: true)
  final File? image;

  CreatePostRequestModel({
    required this.expertId,
    required this.content,
    this.image,
  });

  Map<String, dynamic> toJson() => _$CreatePostRequestModelToJson(this);

  factory CreatePostRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePostRequestModelFromJson(json);
}
