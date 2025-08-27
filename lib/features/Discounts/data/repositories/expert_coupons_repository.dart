import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/networks/failures.dart';
import 'package:graduation_project/features/Discounts/data/models/get_coupons_expertId/show_expert_coupons_data.dart';
import '../data_sources/coupons_service.dart';

class ExpertCouponsRepository {
  final CouponsService service;

  ExpertCouponsRepository(this.service);

  Future<Either<Failures, List<ShowExpertCouponsData>>> getExpertCoupons(int expertId) async {
    try {
      final response = await service.get_coupons(expertId);
      return Right(response.data.data ?? []);
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}