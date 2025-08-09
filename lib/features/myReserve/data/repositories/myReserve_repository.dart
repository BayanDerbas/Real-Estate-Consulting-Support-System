import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/myReserve/data/models/myReserve_response.dart';
import '../../../../core/networks/failures.dart';
import '../data_sources/myReserve_api_service.dart';

abstract class MyReserveRepository{
  Future<Either<Failures,MyReserveResponse>> getReserveationByStatus(String status);
}

class MyReserveRepositoryImpl implements MyReserveRepository{
  final MyReserveService myReserveService;

  MyReserveRepositoryImpl(this.myReserveService);

  @override
  Future<Either<Failures, MyReserveResponse>> getReserveationByStatus(String status) async {
    try{
      final response = await myReserveService.getReservationsByStatus(status);
      return right(response);
    }catch(e,stackTrace){
      print("UnExpected error : $stackTrace\n");
      return Left(serverFailure('Unexpected error: $e\n'));
    }
  }
}