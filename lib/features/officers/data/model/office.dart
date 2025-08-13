import 'package:graduation_project/features/officers/data/model/userOffice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'office.g.dart';

@JsonSerializable()
class Office {
  final int? id;
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? imageUrl;
  final UserOffice? user;
  final String? bio;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? commercialRegisterImage;

  Office({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.imageUrl,
    this.user,
    this.bio,
    this.location,
    this.latitude,
    this.longitude,
    this.commercialRegisterImage,
  });

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}


// import 'package:graduation_project/features/officers/data/model/userOffice.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'office.g.dart';
//
// @JsonSerializable()
// class Office {
//   final int? id;
//   final UserOffice? user;
//   final String? bio;
//   final String? location;
//   final double? latitude;
//   final double? longitude;
//   final String? commercialRegisterImage;
//
//   Office({
//     this.id,
//     this.user,
//     this.bio,
//     this.location,
//     this.latitude,
//     this.longitude,
//     this.commercialRegisterImage,
//   });
//
//   factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
//   Map<String, dynamic> toJson() => _$OfficeToJson(this);
// }
