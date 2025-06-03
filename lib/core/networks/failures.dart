import 'dart:developer';

import 'package:dio/dio.dart';

abstract class Failures {
  final String err_message;

  Failures(this.err_message);
}

class serverFailure extends Failures {
  serverFailure(super.err_message);

  factory serverFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return serverFailure("Connection TimeOut with ApiServer");
      case DioExceptionType.sendTimeout:
        return serverFailure("Send TimeOut with ApiServer");
      case DioExceptionType.receiveTimeout:
        return serverFailure("Recieve TimeOut with ApiServer");
      case DioExceptionType.badCertificate:
        return serverFailure("Bad Certificate Exception");
      case DioExceptionType.cancel:
        return serverFailure("Cancel Operation");
      case DioExceptionType.connectionError:
        return serverFailure("Error in the connection");
      case DioExceptionType.unknown:
        if (dioException.message?.contains("SocketException") ?? false) {
          return serverFailure('No Internet Connection');
        }
        return serverFailure(dioException.error.toString());
      case DioExceptionType.badResponse:
        log("Status code : ${dioException.response!.statusCode!}");
        return serverFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      default:
        return serverFailure('unknown error');
    }
  }

  factory serverFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return serverFailure(response.toString());
    } else if (statusCode == 404) {
      return serverFailure('Your request is not found .');
    } else if (statusCode == 500) {
      return serverFailure(response.toString());
    } else {
      return serverFailure('Opps !! , there was an error , please try again .');
    }
  }
}
