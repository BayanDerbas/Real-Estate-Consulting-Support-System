import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/networks/failures.dart';
import 'package:graduation_project/features/service%20provider/data/data_source/follow_unfollow/follow_unfollow_service.dart';
import 'package:graduation_project/features/service%20provider/data/model/follow_unfollow/follow_model.dart';

import '../../model/get_me_client/get_me_client.dart';

class Follow_UnFollow_Repository {
  final Follow_UnFollow_service service;

  Follow_UnFollow_Repository(this.service);

  Future<Either<Failures, FollowModel>> followExpert(int expertId) async {
    try {
      final response = await service.followExpert(expertId);
      return Right(response);
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  Future<Either<Failures, Unit>> unfollowExpert(int expertId) async {
    try {
      await service.unfollowExpert(expertId);
      return Right(unit);
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  Future<Either<Failures, GetMeClient>> getMeClient() async {
    try {
      final response = await service.get_me_client();
      return Right(response);
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}
