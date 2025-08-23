// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as String?,
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  token: json['token'] as String?,
  refreshToken: json['refreshToken'] as String?,
  userRoleData: Data._userRoleDataFromJson(
    json['userRoleData'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'token': instance.token,
  'refreshToken': instance.refreshToken,
  'userRoleData': instance.userRoleData,
};

LoginUser _$LoginUserFromJson(Map<String, dynamic> json) => LoginUser(
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
);

Map<String, dynamic> _$LoginUserToJson(LoginUser instance) => <String, dynamic>{
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
};

LoginClient _$LoginClientFromJson(Map<String, dynamic> json) => LoginClient(
  id: (json['id'] as num?)?.toInt(),
  user:
      json['user'] == null
          ? null
          : LoginUser.fromJson(json['user'] as Map<String, dynamic>),
  favorites: json['favorites'] as List<dynamic>?,
  followers: json['followers'] as List<dynamic>?,
);

Map<String, dynamic> _$LoginClientToJson(LoginClient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'favorites': instance.favorites,
      'followers': instance.followers,
    };

LoginOffice _$LoginOfficeFromJson(Map<String, dynamic> json) => LoginOffice(
  id: (json['id'] as num?)?.toInt(),
  user:
      json['user'] == null
          ? null
          : LoginUser.fromJson(json['user'] as Map<String, dynamic>),
  bio: json['bio'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  rateCount: (json['rateCount'] as num?)?.toDouble(),
  location: json['location'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  commercialRegisterImage: json['commercialRegisterImage'] as String?,
);

Map<String, dynamic> _$LoginOfficeToJson(LoginOffice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'bio': instance.bio,
      'rating': instance.rating,
      'rateCount': instance.rateCount,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'commercialRegisterImage': instance.commercialRegisterImage,
    };

LoginExpert _$LoginExpertFromJson(Map<String, dynamic> json) => LoginExpert(
  id: (json['id'] as num?)?.toInt(),
  user:
      json['user'] == null
          ? null
          : LoginUser.fromJson(json['user'] as Map<String, dynamic>),
  profession: json['profession'] as String?,
  experience: json['experience'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  rateCount: (json['rateCount'] as num?)?.toDouble(),
  bio: json['bio'] as String?,
  idCardImage: json['idCardImage'] as String?,
  degreeCertificateImage: json['degreeCertificateImage'] as String?,
  perMinuteVideo: (json['perMinuteVideo'] as num?)?.toDouble(),
  perMinuteAudio: (json['perMinuteAudio'] as num?)?.toDouble(),
  followersCount: (json['followersCount'] as num?)?.toInt(),
  favoritesCount: (json['favoritesCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$LoginExpertToJson(LoginExpert instance) =>
    <String, dynamic>{
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
    };
