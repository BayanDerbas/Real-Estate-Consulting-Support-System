import 'package:json_annotation/json_annotation.dart';

part 'posts_response_model.g.dart';

@JsonSerializable()
class PostsResponseModel {
  final String? status;
  final List<PostsData>? data;

  PostsResponseModel({this.status, this.data});

  factory PostsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostsResponseModelToJson(this);
}

@JsonSerializable()
class PostsData {
  final int? id;
  final Expert? expert;
  final String? content;
  final String? imageUrl;
  final String? createdAt;

  PostsData({this.id, this.expert, this.content, this.imageUrl, this.createdAt});

  factory PostsData.fromJson(Map<String, dynamic> json) =>
      _$PostsDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostsDataToJson(this);
}

@JsonSerializable()
class Expert {
  final int? id;
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? profession;
  final String? experience;
  final double? rating;
  final double? rateCount;
  final String? imageUrl;

  Expert({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.profession,
    this.experience,
    this.rating,
    this.rateCount,
    this.imageUrl,
  });

  factory Expert.fromJson(Map<String, dynamic> json) => _$ExpertFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertToJson(this);
}
