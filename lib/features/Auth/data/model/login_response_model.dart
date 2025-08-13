import 'dart:convert';

class LoginResponse {
  final String? status;
  final Data? data;

  LoginResponse({this.status, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String? token;
  final String? refreshToken;
  final dynamic? userRoleData;

  Data({this.token, this.refreshToken, this.userRoleData});

  factory Data.fromJson(Map<String, dynamic> json) {
    dynamic userRole;
    if (json.containsKey('client')) {
      userRole = LoginClient.fromJson(json['client']);
    } else if (json.containsKey('office')) {
      userRole = LoginOffice.fromJson(json['office']);
    } else if (json.containsKey('expert')) {
      userRole = LoginExpert.fromJson(json['expert']);
    }

    return Data(
      token: json['token'],
      refreshToken: json['refreshToken'],
      userRoleData: userRole,
    );
  }
}

class LoginUser {
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

  LoginUser({
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
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      fcmToken: json['fcmToken'],
      enabled: json['enabled'],
      role: json['role'],
      status: json['status'],
      imageUrl: json['imageUrl'],
    );
  }
}

class LoginClient {
  final int? id;
  final LoginUser? user;
  final List<dynamic>? favorites;
  final List<dynamic>? followers;

  LoginClient({this.id, this.user, this.favorites, this.followers});

  factory LoginClient.fromJson(Map<String, dynamic> json) {
    return LoginClient(
      id: json['id'],
      user: LoginUser.fromJson(json['user']),
      favorites: json['favorites'],
      followers: json['followers'],
    );
  }
}

class LoginOffice {
  final int? id;
  final LoginUser? user;
  final String? bio;
  final String? rating;
  final double? rateCount;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? commercialRegisterImage;

  LoginOffice({
    this.id,
    this.user,
    this.bio,
    this.rating,
    this.rateCount,
    this.location,
    this.latitude,
    this.longitude,
    this.commercialRegisterImage,
  });

  factory LoginOffice.fromJson(Map<String, dynamic> json) {
    return LoginOffice(
      id: json['id'],
      user: LoginUser.fromJson(json['user']),
      bio: json['bio'],
      rating: json['rating'],
      rateCount: json['rateCount'].toDouble(),
      location: json['location'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      commercialRegisterImage: json['commercialRegisterImage'],
    );
  }
}

class LoginExpert {
  final int? id;
  final LoginUser? user;
  final String? profession;
  final String? experience;
  final double? rating;
  final double? rateCount;
  final String? bio;
  final String? idCardImage;
  final String? degreeCertificateImage;
  final double? perMinuteVideo;
  final double? perMinuteAudio;
  final int? followersCount;
  final int? favoritesCount;

  LoginExpert({
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
  });

  factory LoginExpert.fromJson(Map<String, dynamic> json) {
    return LoginExpert(
      id: json['id'],
      user: LoginUser.fromJson(json['user']),
      profession: json['profession'],
      experience: json['experience'],
      rating: json['rating'].toDouble(),
      rateCount: json['rateCount'].toDouble(),
      bio: json['bio'],
      idCardImage: json['idCardImage'],
      degreeCertificateImage: json['degreeCertificateImage'],
      perMinuteVideo: json['perMinuteVideo'].toDouble(),
      perMinuteAudio: json['perMinuteAudio'].toDouble(),
      followersCount: json['followersCount'],
      favoritesCount: json['favoritesCount'],
    );
  }
}
