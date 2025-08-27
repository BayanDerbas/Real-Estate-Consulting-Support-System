import 'package:dio/dio.dart';
import 'package:graduation_project/features/Discounts/data/models/create_coupons/create_coupons_response.dart';
import 'package:graduation_project/features/Discounts/data/models/get_coupons_expertId/show_expert_coupons_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networks/api_constant.dart';
import '../models/get_all_coupons/get_all_coupons_response.dart';

part 'coupons_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class CouponsService{
  factory CouponsService(Dio dio) = _CouponsService;

  @POST(ApiConstant.create_coupons)
  Future<HttpResponse<CreateCouponsResponse>> create_coupons({
    @Body() required Map<String,dynamic> body,
});

  @GET(ApiConstant.get_expert_coupons)
  Future<HttpResponse<ShowExpertCouponsResponse>> get_coupons(@Path("expertId") int expertId);

  @GET(ApiConstant.get_coupons)
  Future<HttpResponse<GetAllCouponsResponse>> get_all_coupons();
}