import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networks/api_constant.dart';
import '../../model/rating/rating_response.dart';

part 'rating_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RatingService {
  factory RatingService(Dio dio, {String baseUrl}) = _RatingService;

  @POST("${ApiConstant.rating_expert}/{expertId}")
  Future<RatingResponse> rateExpert(
      @Path("expertId") int expertId,
      @Query("rate") double rate,
      );

  @POST("${ApiConstant.rating_office}/{officeId}")
  Future<RatingResponse> rateOffice(
      @Path("officeId") int officeId,
      @Query("rate") double rate,
      );
}
