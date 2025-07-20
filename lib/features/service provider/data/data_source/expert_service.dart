import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networks/api_constant.dart';
import '../model/expert_response.dart';

part 'expert_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ExpertService {
  factory ExpertService(Dio dio, {String baseUrl}) = _ExpertService;

  @GET(ApiConstant.getAllExperts)
  Future<ExpertResponse> getExperts({
    @Query("page") required int page,
    @Query("size") required int size,
  });

  @GET("${ApiConstant.getAllExperts}/{id}")
  Future<ExpertByIdResponse> getExpertById(@Path("id") String expertId);

}
