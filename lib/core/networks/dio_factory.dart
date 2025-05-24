import 'package:dio/dio.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 15);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioHeaders();
      return dio!;
    } else
      return dio!;
  }

  static void addDioHeaders() async {
    dio?.options.headers = {'Accept': 'application/json'};
  }

  static void setTokenIntoHeadersAfterLogin(String token) {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }
}
