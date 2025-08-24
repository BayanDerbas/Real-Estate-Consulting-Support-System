import 'package:dio/dio.dart';
import 'package:graduation_project/features/Discounts/data/models/create_coupons/create_coupons_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networks/api_constant.dart';

part 'coupons_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class CouponsService{
  factory CouponsService(Dio dio) = _CouponsService;

  @POST(ApiConstant.create_coupons)
  Future<HttpResponse<CreateCouponsResponse>> create_coupons({
    @Body() required Map<String,dynamic> body,
});

  // @GET(ApiConstant.show_coupons)
  // Future<HttpResponse<List<ShowCouponsData>>> get_coupons();
}