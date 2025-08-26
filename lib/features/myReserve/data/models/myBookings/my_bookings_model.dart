import 'package:json_annotation/json_annotation.dart';

part 'my_bookings_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MyBookingsResponse {
  final String? status;
  final List<MyBookingData>? data;

  MyBookingsResponse({this.status, this.data});

  factory MyBookingsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyBookingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyBookingsResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MyBookingData {
  final int? id;
  final Client? client;
  final Expert? expert;
  final String? clientSecret;
  final String? callType;
  final int? duration;
  final double? originalPrice;
  final double? discountAmount;
  final double? finalPrice;
  final String? startTime;
  final String? endTime;
  final String? bookingStatus;
  final String? refundStatus;
  final String? scheduled_at;
  final String? cancelled_at;
  final String? cancelled_by;
  final String? cancellationReason;
  final String? feedback;

  MyBookingData({
    this.id,
    this.client,
    this.expert,
    this.clientSecret,
    this.callType,
    this.duration,
    this.originalPrice,
    this.discountAmount,
    this.finalPrice,
    this.startTime,
    this.endTime,
    this.bookingStatus,
    this.refundStatus,
    this.scheduled_at,
    this.cancelled_at,
    this.cancelled_by,
    this.cancellationReason,
    this.feedback,
  });

  factory MyBookingData.fromJson(Map<String, dynamic> json) =>
      _$MyBookingDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyBookingDataToJson(this);
}

@JsonSerializable()
class Client {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? fcmToken;
  final bool? enabled;
  final String? role;
  final String? status;
  final String? imageUrl;
  final int? warnsCount;
  final int? blocksCount;

  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.fcmToken,
    this.enabled,
    this.role,
    this.status,
    this.imageUrl,
    this.warnsCount,
    this.blocksCount,
  });

  factory Client.fromJson(Map<String, dynamic> json) =>
      _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Expert {
  final int? id;
  final User? user;
  final String? profession;
  final String? experience;
  final double? rating;
  final int? rateCount;
  final String? bio;
  final String? idCardImage;
  final String? degreeCertificateImage;
  final double? perMinuteVideo;
  final double? perMinuteAudio;
  final int? followersCount;
  final int? favoritesCount;
  final bool? newExpert;

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
    this.followersCount,
    this.favoritesCount,
    this.newExpert,
  });

  factory Expert.fromJson(Map<String, dynamic> json) =>
      _$ExpertFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertToJson(this);
}

@JsonSerializable()
class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? fcmToken;
  final bool? enabled;
  final String? role;
  final String? status;
  final String? imageUrl;
  final int? warnsCount;
  final int? blocksCount;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.fcmToken,
    this.enabled,
    this.role,
    this.status,
    this.imageUrl,
    this.warnsCount,
    this.blocksCount,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
