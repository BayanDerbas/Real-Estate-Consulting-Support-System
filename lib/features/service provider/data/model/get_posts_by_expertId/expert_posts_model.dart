import 'package:json_annotation/json_annotation.dart';

part 'expert_posts_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ExpertPostsResponse {
  final String? status;
  final List<ExpertPost>? data;

  ExpertPostsResponse({this.status, this.data});

  factory ExpertPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExpertPostsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertPostsResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExpertPost {
  final int? id;
  final Expert? expert;
  final String? content;
  final String? imageUrl;
  final String? createdAt;

  ExpertPost({
    this.id,
    this.expert,
    this.content,
    this.imageUrl,
    this.createdAt,
  });

  factory ExpertPost.fromJson(Map<String, dynamic> json) =>
      _$ExpertPostFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertPostToJson(this);
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
  final int? rateCount;
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

  factory Expert.fromJson(Map<String, dynamic> json) =>
      _$ExpertFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertToJson(this);
}
