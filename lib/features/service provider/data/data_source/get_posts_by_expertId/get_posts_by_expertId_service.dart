import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networks/api_constant.dart';
import '../../model/get_posts_by_expertId/expert_posts_model.dart';

part 'get_posts_by_expertId_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ShowPostsbyExpertId {
   factory ShowPostsbyExpertId(Dio dio) = _ShowPostsbyExpertId;

   @GET(ApiConstant.show_posts_byExpertId)
   Future<ExpertPostsResponse> getPostsByExpert(@Path("expertId") int expertId);
}