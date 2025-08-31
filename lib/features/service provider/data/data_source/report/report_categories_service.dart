import 'package:dio/dio.dart';
import 'package:graduation_project/features/service%20provider/data/model/report/report_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networks/api_constant.dart';
import '../../model/report/report_categories_response.dart';
import '../../model/report/report_request.dart';

part 'report_categories_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ReportCategoriesService {
  factory ReportCategoriesService(Dio dio, {String baseUrl}) =
  _ReportCategoriesService;

  @GET(ApiConstant.reportCategories)
  Future<ReportCategoriesResponse> getReportCategories();

  @POST(ApiConstant.reports)
  Future<ReportResponseModel> createReport(@Body() ReportRequest request);
}
