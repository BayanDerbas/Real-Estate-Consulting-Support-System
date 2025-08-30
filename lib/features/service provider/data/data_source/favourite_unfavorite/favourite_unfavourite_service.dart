import 'package:dio/dio.dart';
import 'package:graduation_project/features/service%20provider/data/model/favourite_unfavorite/favourite_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networks/api_constant.dart';

part 'favourite_unfavourite_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class Favourite_UnFavourite_Service {
  factory Favourite_UnFavourite_Service(Dio dio,{String baseUrl}) = _Favourite_UnFavourite_Service;

  @POST("${ApiConstant.favourite_expert}/{expertId}")
  Future<FavouriteModel> favouriteExpert(@Path("expertId") int expertId);

  @DELETE("${ApiConstant.unfavourite_expert}/{expertId}")
  Future<void> unfavouriteExpert(@Path("expertId") int expertId);
}