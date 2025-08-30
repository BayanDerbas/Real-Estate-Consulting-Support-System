import 'package:dio/dio.dart';
import 'package:graduation_project/features/service%20provider/data/model/follow_unfollow/follow_model.dart';
import 'package:graduation_project/features/service%20provider/data/model/get_me_client/get_me_client.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networks/api_constant.dart';

part 'follow_unfollow_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class  Follow_UnFollow_service {
  factory Follow_UnFollow_service(Dio dio,{String baseUrl}) = _Follow_UnFollow_service;

  @GET(ApiConstant.get_me_client)
  Future<GetMeClient> get_me_client();

  @POST("${ApiConstant.follow_expert}/{expertId}")
  Future<FollowModel> followExpert(@Path("expertId") int expertId);

  @DELETE("${ApiConstant.unfollow_expert}/{expertId}")
  Future<void> unfollowExpert(@Path("expertId") int expertId);
}