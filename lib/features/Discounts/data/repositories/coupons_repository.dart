import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/networks/failures.dart';
import 'package:graduation_project/features/Discounts/data/data_sources/coupons_service.dart';
import 'package:graduation_project/features/Discounts/data/models/create_coupons/create_coupons_response.dart';

class CouponsRepository {
  final CouponsService service;

  CouponsRepository(this.service);

  Future<Either<Failures, CreateCouponsResponse>> create_coupons(
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await service.create_coupons(body: body);
      return Right(response.data!);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}
