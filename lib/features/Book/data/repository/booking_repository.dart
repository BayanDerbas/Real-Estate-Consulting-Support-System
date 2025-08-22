import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/networks/failures.dart';
import '../data_source/booking_api_service.dart';
import '../model/booking_request_model.dart';
import '../model/booking_response.dart';

abstract class BookingRepository {
  Future<Either<Failures, BookingResponse>> createBooking(BookingRequest request);
}

class BookingRepositoryImpl implements BookingRepository {
  final BookingService _bookingService;

  BookingRepositoryImpl(this._bookingService);

  @override
  Future<Either<Failures, BookingResponse>> createBooking(BookingRequest request) async {
    try {
      final response = await _bookingService.createBooking(request);

      if (response.data == null) {
        return Left(serverFailure("Booking response data is null or malformed"));
      }
      return Right(response);
    } on DioException catch (e) {
      print('DioException: ${e.response?.statusCode} - ${e.response?.data}');
      return Left(serverFailure.fromDioError(e));
    } catch (e, stackTrace) {
      print('Unexpected error: $e\nStackTrace: $stackTrace');
      return Left(serverFailure('Unexpected error: $e'));
    }
  }
}