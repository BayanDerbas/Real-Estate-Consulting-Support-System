import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/networks/failures.dart';
import '../data_source/expert_service.dart';
import '../model/expert.dart';

class ExpertRepository {
  final ExpertService api;

  ExpertRepository(this.api);

  Future<Either<Failures, List<Expert>>> getAllExperts({
    required int page,
    required int size,
  }) async {
    try {
      final response = await api.getExperts(page: page, size: size);
      return Right(response.data as List<Expert>);
    } catch (e) {
      if (e is DioException) {
        return Left(serverFailure.fromDioError(e));
      }
      return Left(serverFailure("Unexpected error"));
    }
  }
}
