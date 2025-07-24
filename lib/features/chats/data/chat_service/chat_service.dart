import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networks/api_constant.dart';
import '../model/create_room_request_model.dart';
import '../model/message_model.dart';
import '../model/create_room_response_model.dart';
import '../model/rooms_of_current_user.dart';

part 'chat_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ChatService {
  factory ChatService(Dio dio, {String baseUrl}) = _ChatService;
  @POST(ApiConstant.createRoom)
  Future<HttpResponse<CreateRoomResponseModel>> createRoom(
    @Body() CreateRoomRequestModel body,
  );

  @GET(ApiConstant.getRoomMessages)
  Future<HttpResponse<List<Message>>> getRoomMessages(
    @Path("id") int id,
    @Query("page") int page,
    @Query("size") int size,
  );
  @GET(ApiConstant.getAllRoomsForCurrentUser)
  Future<List<RoomsOfCurrentUser>> getRoomsOfCurrentUser(@Path("id") int id);
  @GET(ApiConstant.getRoomById)
  Future<HttpResponse<CreateRoomResponseModel>> getRoom(@Path("id") int id);
}
