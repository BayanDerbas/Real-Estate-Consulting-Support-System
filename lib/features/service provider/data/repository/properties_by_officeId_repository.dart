import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/networks/failures.dart';
import '../data_source/get_properties_by_officeId/properties_by_officeId_service.dart';
import '../model/get_properties_by_officeId/propertiesByOfficeId_model.dart';

class PropertiesByOfficeIdRepository {
  final PropertiesByOfficeidService service;

  PropertiesByOfficeIdRepository(this.service);

  Future<Either<Failures, PropertiesByOfficeIdResponse>> getPropertiesByOfficeId({
    required int officeId,
    int page = 0,
    int size = 10,
  }) async {
    try {
      final result = await service.getPropertiesByOfficeId(officeId, page, size);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return Left(serverFailure.fromDioError(e));
      }
      return Left(serverFailure(e.toString()));
    }
  }
}