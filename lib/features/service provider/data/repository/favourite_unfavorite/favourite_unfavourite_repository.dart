import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/service%20provider/data/data_source/favourite_unfavorite/favourite_unfavourite_service.dart';
import 'package:graduation_project/features/service%20provider/data/model/favourite_unfavorite/favourite_model.dart';
import '../../../../../core/networks/failures.dart';

class Favourite_UnFavourite_Repository {
  final Favourite_UnFavourite_Service service;

  Favourite_UnFavourite_Repository(this.service);

  Future<Either<Failures, FavouriteModel>> favouriteExpert(int expertId) async {
    try {
      final response = await service.favouriteExpert(expertId);
      return Right(response);
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  Future<Either<Failures, Unit>> unfavouriteExpert(int expertId) async {
    try {
      await service.unfavouriteExpert(expertId);
      return Right(unit);
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}