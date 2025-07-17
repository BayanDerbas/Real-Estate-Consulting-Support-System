import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networks/api_constant.dart';
import '../model/message_model.dart';
import '../model/room_model.dart';
import '../model/rooms_of_current_user.dart';

part 'chat_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ChatService {
  factory ChatService(Dio dio, {String baseUrl}) = _ChatService;

  @POST(ApiConstant.createRoom)
  Future<HttpResponse<ChatRoomModel>> createRoom(
    @Body() Map<String, dynamic> body,
  );
  @GET(ApiConstant.getRoomMessages)
  Future<HttpResponse<List<Message>>> getRoomMessages(
    @Path("roomId") int roomId,
    @Query("page") int page,
    @Query("size") int size,
  );
  @GET(ApiConstant.getAllRoomsForCurrentUser)
  Future<List<RoomsOfCurrentUser>> getRoomsOfCurrentUser(
    @Path("id") int userId,
  );
  @GET(ApiConstant.getRoomById)
  Future<HttpResponse<ChatRoomModel>> getRoom(@Path("roomId") int roomId);
}
