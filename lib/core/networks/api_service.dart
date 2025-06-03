import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'api_constant.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
}
