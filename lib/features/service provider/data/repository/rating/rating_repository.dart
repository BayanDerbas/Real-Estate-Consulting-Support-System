import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/networks/failures.dart';
import '../../data_source/rating/rating_service.dart';
import '../../model/rating/rating_response.dart';

class RatingRepository {
  final RatingService service;

  RatingRepository(this.service);

  Future<Either<String, RatingResponse>> rateExpert(int expertId, double rate) async {
    try {
      final response = await service.rateExpert(expertId, rate);
      return Right(response);
    } catch (e) {
      return Left("Error :${serverFailure(e.toString())}");
    }
  }

  Future<Either<String, RatingResponse>> rateOffice(int officeId, double rate) async {
    try {
      final response = await service.rateOffice(officeId, rate);
      return Right(response);
    } catch (e) {
      return Left("Error :${serverFailure(e.toString())}");
    }
  }
}
