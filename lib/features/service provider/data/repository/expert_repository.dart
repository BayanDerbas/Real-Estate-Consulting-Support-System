import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/networks/failures.dart';
import '../../../ticket/data/model/filter_model.dart';
import '../data_source/expert_service.dart';
import '../model/expert.dart';
import '../model/expert_response.dart';

class ExpertRepository {
  final ExpertService api;

  ExpertRepository(this.api);

  Future<Either<Failures, ExpertResponse>> getAllExperts({
    required int page,
    required int size,
  }) async {
    try {
      final response = await api.getExperts(page: page, size: size);
      return Right(response.data);
    } catch (e) {
      if (e is DioException) {
        return Left(serverFailure.fromDioError(e));
      }
      return Left(serverFailure("Unexpected error"));
    }
  }

  Future<Either<Failures, ExpertResponse>> filterExperts(
    FilterModel filter,
  ) async {
    try {
      final httpResponse = await api.filterExperts(filter);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}
