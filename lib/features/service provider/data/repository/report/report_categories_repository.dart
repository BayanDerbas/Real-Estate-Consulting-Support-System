import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/networks/failures.dart';
import '../../data_source/report/report_categories_service.dart';
import '../../model/report/report_request.dart';
import '../../model/report/report_response_model.dart';

abstract class ReportRepository {
  Future<Either<Failures, List>> fetchCategories();
  Future<Either<Failures, ReportResponseModel>> createReport(ReportRequest request);
}

class ReportRepositoryImpl implements ReportRepository {
  final ReportCategoriesService service;

  ReportRepositoryImpl({required this.service});

  @override
  Future<Either<Failures, List>> fetchCategories() async {
    try {
      final res = await service.getReportCategories();
      return Right(res.data ?? []);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failures, ReportResponseModel>> createReport(ReportRequest request) async {
    try {
      final res = await service.createReport(request);
      return Right(res);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure('Unexpected error: $e'));
    }
  }
}
