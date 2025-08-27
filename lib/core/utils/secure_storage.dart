import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graduation_project/features/Book/data/model/booking_data_model.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();
  final _tokenKey = 'accessToken';
  final _refreshTokenKey = 'refreshToken';
  final _userId = 'userId';
  final _userName = 'userName';
  final _userType = 'role';
  final _email = 'email';
  final _officeId = 'officeId';
  final _idCardImage = 'idCardImage';
  final _commercialRegisterImage = 'commercialRegisterImage';
  final _profileImage = 'imageUrl';
  final _langCode = 'langCode';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> saveLangCode(String langKey) async {
    await _storage.write(key: _langCode, value: langKey);
  }

  Future<void> saveOfficeId(String officeId) async {
    await _storage.write(key: _officeId, value: officeId);
  }

  Future<void> saveIdCall(String id) async {
    await _storage.write(key: 'callId', value: id);
  }

  Future<void> saveNameCall(String name) async {
    await _storage.write(key: 'callName', value: name);
  }

  Future<void> saveReservations(List<BookingData> reservations) async {
    final jsonList = reservations.map((r) => r.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    await _storage.write(key: 'reservations', value: jsonString);
    print("\nsaved reservations successfully in SecureStorage\n");
  }

  Future<String?> getCallName() async {
    return await _storage.read(key: 'callName');
  }

  Future<String?> getLangKey() async {
    return await _storage.read(key: _langCode);
  }

  Future<String?> getCallId() async {
    return await _storage.read(key: 'callId');
  }

  Future<String?> getOfficeId() async {
    return await _storage.read(key: _officeId);
  }

  ///////////////test//////////////////////////
  Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<void> saveUserName(String userName) async {
    await _storage.write(key: _userName, value: userName);
  }

  Future<void> saveUserType(String userType) async {
    await _storage.write(key: _userType, value: userType);
  }

  Future<void> saveUserId(String userId) async {
    await _storage.write(key: _userId, value: userId);
  }

  Future<void> saveEmail(String email) async {
    await _storage.write(key: _email, value: email);
  }

  Future<void> saveIdCardImage(String userImage) async {
    await _storage.write(key: _idCardImage, value: userImage);
  }

  Future<void> saveCommercialRegisterImage(String userImage) async {
    await _storage.write(key: _commercialRegisterImage, value: userImage);
  }

  Future<void> saveProfileImage(String userImage) async {
    await _storage.write(key: _profileImage, value: userImage);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    return await _storage.delete(key: _tokenKey);
  }

  Future<void> deleteRefreshToken() async {
    return await _storage.delete(key: _refreshTokenKey);
  }

  Future<String?> getUserType() async {
    return await _storage.read(key: _userType);
  }

  Future<String?> getEmail() async {
    return await _storage.read(key: _email);
  }

  Future<String?> getUserName() async {
    return await _storage.read(key: _userName);
  }

  Future<String?> getIdCardImage() async {
    return await _storage.read(key: _idCardImage);
  }

  Future<String?> getCommercialRegisterImage() async {
    return await _storage.read(key: _commercialRegisterImage);
  }

  Future<String?> getProfileImage() async {
    return await _storage.read(key: _profileImage);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<String?> getUserId() async {
    return await _storage.read(key: _userId);
  }

  Future<List<BookingData>> getReservations() async {
    final jsonString = await _storage.read(key: 'reservations');
    if (jsonString == null) return [];
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => BookingData.fromJson(json)).toList();
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<String?> getUserImageByRole() async {
    final role = await getUserType();
    switch (role) {
      case 'EXPERT':
        await getIdCardImage();
      case 'OFFICE':
        await getCommercialRegisterImage();
      case 'USER':
      default:
        await getProfileImage();
    }
  }

  Future<void> saveUserIdByRole(String id, String role) async {
    switch (role) {
      case 'EXPERT':
        await _storage.write(key: 'expertId', value: id);
        break;
      case 'OFFICE':
        await _storage.write(key: 'officeId', value: id);
        break;
      case 'USER':
      default:
        await _storage.write(key: 'clientId', value: id);
    }
  }

  Future<String?> getIdByRole() async {
    final role = await getUserType();
    switch (role) {
      case 'EXPERT':
        return await _storage.read(key: 'expertId');
      case 'OFFICE':
        return await _storage.read(key: 'officeId');
      case 'USER':
      default:
        return await _storage.read(key: 'clientId');
    }
  }
}
