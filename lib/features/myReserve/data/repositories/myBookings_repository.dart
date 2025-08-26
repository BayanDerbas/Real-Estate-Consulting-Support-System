import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/networks/failures.dart';
import 'package:graduation_project/features/myReserve/data/models/myBookings/my_bookings_model.dart';
import 'package:graduation_project/features/myReserve/data/models/myReserve_response.dart';
import '../data_sources/myBookings_service.dart';

class MyBookingsRepository {
  final MyBookingsApi service;

  MyBookingsRepository(this.service);
  Future<Either<Failures,MyBookingsResponse>> getBookings (String status) async {
    try {
        final response = await service.getMyBookings(status);
        return Right(response);
    } catch (e) {
      return Left(serverFailure("Error fetching bookings: $e"));
    }
  }
}