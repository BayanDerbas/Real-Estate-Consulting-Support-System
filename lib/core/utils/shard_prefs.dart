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
}
