import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/networks/failures.dart';
import '../data_source/booking_api_service.dart';
import '../model/booking_request_model.dart';
import '../model/booking_response.dart';

abstract class BookingRepository {
  Future<Either<Failures, BookingResponse>> createBooking(
    BookingRequest request,
  );
}

class BookingRepositoryImpl implements BookingRepository {
  final BookingService _bookingService;

  BookingRepositoryImpl(this._bookingService);

  @override
  Future<Either<Failures, BookingResponse>> createBooking(
    BookingRequest request,
  ) async {
    try {
      final response = await _bookingService.createBooking(request);

      if (response.data == null) {
        return Left(
          serverFailure("Booking response data is null or malformed"),
        );
      }
      return Right(response);
    } on DioException catch (e) {
      print('DioException: ${e.response?.statusCode} - ${e.response?.data}');

      String errorMessage = "حدث خطأ غير متوقع";
      if (e.response?.data is Map<String, dynamic>) {
        final data = e.response!.data as Map<String, dynamic>;
        if (data["errors"] is List && data["errors"].isNotEmpty) {
          errorMessage = data["errors"][0]["message"] ?? errorMessage;
        } else if (data["message"] != null) {
          errorMessage = data["message"];
        }
      }

      Get.snackbar(
        'Booking failed',
        errorMessage,
      );

      return Left(serverFailure(errorMessage));
    } catch (e, stackTrace) {
      print('Unexpected error: $e\nStackTrace: $stackTrace');
      final failure = serverFailure(e.toString());
      Get.snackbar('Booking failed', failure.err_message);
      return Left(failure);
    }
  }
}
