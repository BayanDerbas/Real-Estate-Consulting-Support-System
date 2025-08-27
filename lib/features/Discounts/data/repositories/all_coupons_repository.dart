import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/networks/failures.dart';
import 'package:graduation_project/features/Discounts/data/models/get_all_coupons/get_all_coupons_data.dart';

import '../data_sources/coupons_service.dart';

class AllCouponsRepository{
  final CouponsService service;

  AllCouponsRepository(this.service);

  Future<Either<Failures,List<GetAllCouponsData>>> get_all_coupons() async {
    try{
      final response = await service.get_all_coupons();
      return Right(response.data.data ?? []);
    } catch (e){
      return Left(serverFailure(e.toString()));
    }
  }
}