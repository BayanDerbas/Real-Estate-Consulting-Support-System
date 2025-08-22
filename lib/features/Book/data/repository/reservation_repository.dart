import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/Book/data/data_source/reservation_service.dart';
import 'package:graduation_project/features/Book/data/model/get_working_times/working_times_data.dart';
import '../../../../core/networks/failures.dart';
import '../model/reservation_response.dart';

class ReservationRepository {
  final ReservationService _service;

  ReservationRepository(this._service);

  Future<Either<Failures, ReservationData>> getReservations(int expertId) async {
    try {
      final response = await _service.getReservations(expertId);
      return Right(response.data);
    } catch (e) {
      return Left(serverFailure('حدث خطأ أثناء تحميل الحجوزات'));
    }
  }

  Future<Either<Failures,List<WorkingTimesData>>> getWorkingTimes(int expertId) async {
    try {
      final response = await _service.getWorkingTimes(expertId);
      return Right(response.data ?? []);
    } catch (e){
      return Left(serverFailure(e.toString()));
    }
  }
}
