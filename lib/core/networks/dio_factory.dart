import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;
  static final FlutterSecureStorage _secureStorage =
      const FlutterSecureStorage();

  static Dio getDio() {
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = const Duration(seconds: 15)
        ..options.receiveTimeout = const Duration(seconds: 15);
      dio!.options.headers = {'Accept': 'application/json'};
    }
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: false,
        maxWidth: 120,
      ),
    );
    return dio!;
  }

  static Future<void> setToken(String token) async {
    await _secureStorage.write(key: 'access_token', value: token);
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }

  static Future<void> loadToken() async {
    final token = await _secureStorage.read(key: 'access_token');
    if (token != null) {
      dio?.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static Future<void> clearToken() async {
    await _secureStorage.delete(key: 'access_token');
    dio?.options.headers.remove('Authorization');
  }
}
