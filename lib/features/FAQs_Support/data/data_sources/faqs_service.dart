import 'package:dio/dio.dart';
import 'package:graduation_project/features/FAQs_Support/data/models/faqs_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networks/api_constant.dart';

part 'faqs_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class FAQsService {
  factory FAQsService(Dio dio) = _FAQsService;

  @GET("${ApiConstant.FAQS}")
  Future<HttpResponse<FAQsResponse>> getFAQs(
    @Query("page") int page,
    @Query("size") int size,
  );
}
