import 'package:dartz/dartz.dart';
import '../../../../core/networks/failures.dart';
import '../data_source/get_posts_by_expertId/get_posts_by_expertId_service.dart';
import '../model/get_posts_by_expertId/expert_posts_model.dart';

class ExpertPostsRepository {
  final ShowPostsbyExpertId service;

  ExpertPostsRepository(this.service);

  Future<Either<Failures, ExpertPostsResponse>> getPostsByExpert(int expertId) async {
    try {
      final response = await service.getPostsByExpert(expertId);
      return Right(response);
    } catch (e) {
      return Left(serverFailure("Error fetching expert posts: $e"));
    }
  }
}
