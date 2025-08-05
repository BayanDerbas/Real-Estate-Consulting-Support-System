import 'package:json_annotation/json_annotation.dart';

part 'post_response_model.g.dart';

@JsonSerializable()
class PostResponseModel {
  final String? status;
  final PostData? data;

  PostResponseModel({this.status, this.data});

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostResponseModelToJson(this);
}

@JsonSerializable()
class PostData {
  final int? id;
  final Expert? expert;
  final String? content;
  final String? imageUrl;
  final String? createdAt;

  PostData({this.id, this.expert, this.content, this.imageUrl, this.createdAt});

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);

  Map<String, dynamic> toJson() => _$PostDataToJson(this);
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
  final int? rating;
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

  factory Expert.fromJson(Map<String, dynamic> json) => _$ExpertFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertToJson(this);
}
