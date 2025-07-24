import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();
  final _tokenKey = 'accessToken';
  final _refreshTokenKey = 'refreshToken';
  final _userId = 'userId';
  final _userName = 'userName';
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  ///////////////test////////////////////////
  Future<void> saveIdCall(String id) async {
    await _storage.write(key: 'callId', value: id);
  }

  Future<void> saveNameCall(String name) async {
    await _storage.write(key: 'callName', value: name);
  }

  Future<String?> getCallName() async {
    return await _storage.read(key: 'callName');
  }

  Future<String?> getCallId() async {
    return await _storage.read(key: 'callId');
  }

  ///////////////test//////////////////////////
  Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<void> saveUserName(String userName) async {
    await _storage.write(key: _userName, value: userName);
  }

  Future<void> saveUserId(String userId) async {
    await _storage.write(key: _userId, value: userId);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<String?> getUserName() async {
    return await _storage.read(key: _userName);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<String?> getUserId() async {
    return await _storage.read(key: _userId);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
