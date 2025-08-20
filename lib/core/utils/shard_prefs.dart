import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _prefs;

  static const String _tokenKey = 'auth_token';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken(String token) async {
    await _prefs?.setString(_tokenKey, token);
  }

  static Future<void> saveEmail(String email) async {
    await _prefs?.setString('email', email);
  }

  static String? getEmail() {
    return _prefs?.getString('email');
  }

  static String? getToken() {
    return _prefs?.getString(_tokenKey);
  }

  static Future<void> clearToken() async {
    await _prefs?.remove(_tokenKey);
  }

  static Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static Future<void> saveInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  static int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  static void removeKey(String key) async {
    await _prefs?.remove(key);
  }
}
