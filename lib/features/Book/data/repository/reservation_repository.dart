import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/Book/data/data_source/reservation_service.dart';
import '../../../../core/networks/failures.dart';
import '../model/reservation_response.dart';

class ReservationRepository {
  final ReservationService _service;

  ReservationRepository(this._service);

  Future<Either<Failures, ReservationData>> getReservation(int expertId) async {
    try {
      final response = await _service.getReservation(expertId);
      return Right(response.data);
    } catch (e) {
      return Left(serverFailure('حدث خطأ أثناء تحميل الحجوزات'));
    }
  }
}
