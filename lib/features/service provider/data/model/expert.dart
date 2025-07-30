import 'package:graduation_project/features/service%20provider/data/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expert.g.dart';

@JsonSerializable()
class Expert {
  final int? id;
  final User? user;
  final String? profession;
  final String? experience;
  final double? rating;
  final double? rateCount;
  final String? bio;
  final String? idCardImage;
  final String? degreeCertificateImage;
  final double? perMinuteVideo;
  final double? perMinuteAudio;

  Expert({
    this.id,
    this.user,
    this.profession,
    this.experience,
    this.rating,
    this.rateCount,
    this.bio,
    this.idCardImage,
    this.degreeCertificateImage,
    this.perMinuteVideo,
    this.perMinuteAudio,
  });

  factory Expert.fromJson(Map<String, dynamic> json) => _$ExpertFromJson(json);
  Map<String, dynamic> toJson() => _$ExpertToJson(this);
}
