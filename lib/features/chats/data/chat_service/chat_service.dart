import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../data/model/create_room_request_model.dart';
import '../../data/model/create_room_response_model.dart';
import '../../data/model/messages_of_current_room_response.dart';
import '../../data/model/rooms_api_response.dart';
import '../../data/model/rooms_of_current_user.dart';

part 'chat_service.g.dart';

@RestApi(baseUrl: "http://195.88.87.77:8000/api/v1")
abstract class ChatService {
  factory ChatService(Dio dio, {String baseUrl}) = _ChatService;

  @POST('/rooms')
  Future<HttpResponse<CreateRoomApiResponse>> createRoom(
    @Body() CreateRoomRequestModel body,
  );

  @GET('/rooms/{roomId}/messages')
  Future<HttpResponse<MessagesOfCurrentRoomResponse>> getRoomMessages(
    @Path("roomId") int roomId,
    @Query("page") int page,
    @Query("size") int size,
  );

  @GET('/rooms/user/{id}')
  Future<HttpResponse<RoomsApiResponse>> getRoomsForCurrentUser(
    @Path("id") int id,
  );

  @GET('/rooms/{id}')
  Future<HttpResponse<CreateRoomResponseModel>> getRoom(@Path("id") int id);

  @DELETE('/rooms/{id}')
  Future<HttpResponse<void>> deleteRoom(@Path("id") int id);
}
