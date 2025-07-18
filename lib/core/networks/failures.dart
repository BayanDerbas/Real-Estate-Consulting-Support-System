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
    try {
      if (response is Map<String, dynamic>) {
        if (response.containsKey('errors') &&
            response['errors'] is List &&
            response['errors'].isNotEmpty) {
          final errorMessage = response['errors'][0]['message'];
          if (errorMessage != null && errorMessage.toString().isNotEmpty) {
            return serverFailure(errorMessage.toString());
          }
        }
        if (response.containsKey('message') && response['message'] is String) {
          return serverFailure(response['message']);
        }
      }
    } catch (e) {}

    if (statusCode == 400) {
      return serverFailure(
        'Bad request. Please check your input and try again.$response',
      );
    } else if (statusCode == 401) {
      return serverFailure('Unauthorized. Please log in again.');
    } else if (statusCode == 403) {
      return serverFailure(
        'Forbidden. You do not have permission to access this resource.',
      );
    } else if (statusCode == 404) {
      return serverFailure(
        'Request not found. Please check the URL or resource.',
      );
    } else if (statusCode == 500) {
      return serverFailure('Internal server error. Please try again later.');
    } else {
      return serverFailure(
        'Oops! An unexpected error occurred. Please try again.',
      );
    }
  }
}
