import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/networks/failures.dart';
import 'package:graduation_project/features/timeAvailable/data/data_sources/show_working_times_service.dart';
import 'package:graduation_project/features/timeAvailable/data/models/show_working_times_response.dart';

abstract class ShowWorkingTimesRepository{
  Future<Either<Failures,ShowAvailableTimesResponse>> getAvailableTimes(int expertId);
}

class ShowWorkingTimesRepositoryImpl implements ShowWorkingTimesRepository{
  final show_workingTimes_service service;

  ShowWorkingTimesRepositoryImpl({required this.service});
  @override
  Future<Either<Failures, ShowAvailableTimesResponse>> getAvailableTimes(int expertId) async {
    try{
       final response = await service.showWorkingTimes(expertId);
       print('Parsed available times count: ${response.data?.length}');

       print("response : ${response.data}\n");
       return right(response);
    } catch(e){
      print("('Unexpected error: $e\n')");
      return Left(serverFailure('Unexpected error: $e\n'));
    }
  }
}