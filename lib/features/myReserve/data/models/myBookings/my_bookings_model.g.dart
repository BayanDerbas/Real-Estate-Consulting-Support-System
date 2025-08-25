// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_bookings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyBookingsResponse _$MyBookingsResponseFromJson(Map<String, dynamic> json) =>
    MyBookingsResponse(
      status: json['status'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => MyBookingData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MyBookingsResponseToJson(MyBookingsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

MyBookingData _$MyBookingDataFromJson(Map<String, dynamic> json) =>
    MyBookingData(
      id: (json['id'] as num?)?.toInt(),
      client:
          json['client'] == null
              ? null
              : Client.fromJson(json['client'] as Map<String, dynamic>),
      expert:
          json['expert'] == null
              ? null
              : Expert.fromJson(json['expert'] as Map<String, dynamic>),
      clientSecret: json['clientSecret'] as String?,
      callType: json['callType'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      finalPrice: (json['finalPrice'] as num?)?.toDouble(),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      bookingStatus: json['bookingStatus'] as String?,
      refundStatus: json['refundStatus'] as String?,
      scheduled_at: json['scheduled_at'] as String?,
      cancelled_at: json['cancelled_at'] as String?,
      cancelled_by: json['cancelled_by'] as String?,
      cancellationReason: json['cancellationReason'] as String?,
      feedback: json['feedback'] as String?,
    );

Map<String, dynamic> _$MyBookingDataToJson(MyBookingData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client': instance.client?.toJson(),
      'expert': instance.expert?.toJson(),
      'clientSecret': instance.clientSecret,
      'callType': instance.callType,
      'duration': instance.duration,
      'originalPrice': instance.originalPrice,
      'discountAmount': instance.discountAmount,
      'finalPrice': instance.finalPrice,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'bookingStatus': instance.bookingStatus,
      'refundStatus': instance.refundStatus,
      'scheduled_at': instance.scheduled_at,
      'cancelled_at': instance.cancelled_at,
      'cancelled_by': instance.cancelled_by,
      'cancellationReason': instance.cancellationReason,
      'feedback': instance.feedback,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
  id: (json['id'] as num?)?.toInt(),
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  fcmToken: json['fcmToken'] as String?,
  enabled: json['enabled'] as bool?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  imageUrl: json['imageUrl'] as String?,
  warnsCount: (json['warnsCount'] as num?)?.toInt(),
  blocksCount: (json['blocksCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'fcmToken': instance.fcmToken,
  'enabled': instance.enabled,
  'role': instance.role,
  'status': instance.status,
  'imageUrl': instance.imageUrl,
  'warnsCount': instance.warnsCount,
  'blocksCount': instance.blocksCount,
};

Expert _$ExpertFromJson(Map<String, dynamic> json) => Expert(
  id: (json['id'] as num?)?.toInt(),
  user:
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
  profession: json['profession'] as String?,
  experience: json['experience'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  rateCount: (json['rateCount'] as num?)?.toInt(),
  bio: json['bio'] as String?,
  idCardImage: json['idCardImage'] as String?,
  degreeCertificateImage: json['degreeCertificateImage'] as String?,
  perMinuteVideo: (json['perMinuteVideo'] as num?)?.toDouble(),
  perMinuteAudio: (json['perMinuteAudio'] as num?)?.toDouble(),
  followersCount: (json['followersCount'] as num?)?.toInt(),
  favoritesCount: (json['favoritesCount'] as num?)?.toInt(),
  newExpert: json['newExpert'] as bool?,
);

Map<String, dynamic> _$ExpertToJson(Expert instance) => <String, dynamic>{
  'id': instance.id,
  'user': instance.user?.toJson(),
  'profession': instance.profession,
  'experience': instance.experience,
  'rating': instance.rating,
  'rateCount': instance.rateCount,
  'bio': instance.bio,
  'idCardImage': instance.idCardImage,
  'degreeCertificateImage': instance.degreeCertificateImage,
  'perMinuteVideo': instance.perMinuteVideo,
  'perMinuteAudio': instance.perMinuteAudio,
  'followersCount': instance.followersCount,
  'favoritesCount': instance.favoritesCount,
  'newExpert': instance.newExpert,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num?)?.toInt(),
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  fcmToken: json['fcmToken'] as String?,
  enabled: json['enabled'] as bool?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  imageUrl: json['imageUrl'] as String?,
  warnsCount: (json['warnsCount'] as num?)?.toInt(),
  blocksCount: (json['blocksCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'phone': instance.phone,
  'fcmToken': instance.fcmToken,
  'enabled': instance.enabled,
  'role': instance.role,
  'status': instance.status,
  'imageUrl': instance.imageUrl,
  'warnsCount': instance.warnsCount,
  'blocksCount': instance.blocksCount,
};
