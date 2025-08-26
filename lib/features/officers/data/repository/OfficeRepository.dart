import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/networks/failures.dart';
import '../data_source/office_service.dart';
import '../model/office_profile_model.dart';
import '../model/offices_response.dart';

class OfficeRepository {
  final OfficeService service;

  OfficeRepository(this.service);

  Future<Either<String, OfficesResponse>> getAllOffices({
    int page = 0,
    int size = 10,
  }) async {
    try {
      final response = await service.getAllOffices(page: page, size: size);
      return Right(response);
    } catch (e) {
      return Left("Failed to fetch offices: $e");
    }
  }

  Future<Either<Failures, OfficeProfileModel>> getOfficeProfile({
    int id = 0,
  }) async {
    try {
      final response = await service.getOfficeProfile(id);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}
