import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:graduation_project/features/ticket/data/model/publish_ticket_response_model.dart';
import 'package:graduation_project/features/ticket/data/model/publish_ticket_request_model.dart';
import '../../../../../core/networks/api_constant.dart';
import '../../model/filter_tickets_response_model.dart';
import '../../model/ticket_response.dart';

part 'ticket_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class TicketService {
  factory TicketService(Dio dio) = _TicketService;

  @POST(ApiConstant.createTicket)
  Future<HttpResponse<PublishTicketResponseModel>> createTicket(
    @Body() PublishTicketRequestModel request,
  );
  @GET(ApiConstant.getAllTickets)
  Future<HttpResponse<TicketResponse>> getAllTickets(
    @Query("page") int page,
    @Query("size") int size,
  );
  @GET("${ApiConstant.getMyTickets}")
  Future<HttpResponse<TicketResponse>> getMyTickets(
    @Path("clientId") int clientId,
    @Query("page") int page,
    @Query("size") int size,
  );

  @GET(ApiConstant.filterTickets)
  Future<HttpResponse<FilterTicketsResponseModel>> getFilteredTickets({
    @Query("lowPrice") double? lowPrice,
    @Query("highPrice") double? highPrice,
    @Query("serviceType") String? serviceType,
    @Query("houseType") String? houseType,
    @Query("lowArea") String? lowArea,
    @Query("highArea") String? highArea,
    @Query("location") String? location,
  });
}
