import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  final String? status;
  final Data? data;

  LoginResponse({this.status, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  final String? token;
  final String? refreshToken;

  @JsonKey(name: 'userRoleData', fromJson: _userRoleDataFromJson)
  final dynamic userRoleData;

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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{'token': token, 'refreshToken': refreshToken};
    if (userRoleData is LoginClient) {
      map['client'] = (userRoleData as LoginClient).toJson();
    } else if (userRoleData is LoginOffice) {
      map['office'] = (userRoleData as LoginOffice).toJson();
    } else if (userRoleData is LoginExpert) {
      map['expert'] = (userRoleData as LoginExpert).toJson();
    }
    return map;
  }

  static dynamic _userRoleDataFromJson(Map<String, dynamic> json) {
    if (json.containsKey('client')) {
      return LoginClient.fromJson(json['client']);
    } else if (json.containsKey('office')) {
      return LoginOffice.fromJson(json['office']);
    } else if (json.containsKey('expert')) {
      return LoginExpert.fromJson(json['expert']);
    }
    return null;
  }
}

@JsonSerializable()
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

  factory LoginUser.fromJson(Map<String, dynamic> json) =>
      _$LoginUserFromJson(json);
  Map<String, dynamic> toJson() => _$LoginUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginClient {
  final int? id;
  final LoginUser? user;
  final List<dynamic>? favorites;
  final List<dynamic>? followers;

  LoginClient({this.id, this.user, this.favorites, this.followers});

  factory LoginClient.fromJson(Map<String, dynamic> json) =>
      _$LoginClientFromJson(json);
  Map<String, dynamic> toJson() => _$LoginClientToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LoginOffice {
  final int? id;
  final LoginUser? user;
  final String? bio;
  final double? rating;
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

  factory LoginOffice.fromJson(Map<String, dynamic> json) =>
      _$LoginOfficeFromJson(json);
  Map<String, dynamic> toJson() => _$LoginOfficeToJson(this);
}

@JsonSerializable(explicitToJson: true)
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

  factory LoginExpert.fromJson(Map<String, dynamic> json) =>
      _$LoginExpertFromJson(json);
  Map<String, dynamic> toJson() => _$LoginExpertToJson(this);
}
