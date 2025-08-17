import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/networks/failures.dart';

import '../chat_service/chat_service.dart';
import '../model/create_room_request_model.dart';
import '../model/create_room_response_model.dart';
import '../model/message_model.dart';
import '../model/rooms_of_current_user.dart';

class ChatRepository {
  final ChatService _chatService;
  final serverFailure serverFailure1 = serverFailure('Server Error');

  ChatRepository(this._chatService);

  Future<Either<Failures, CreateRoomResponseModel>> createRoom(
    int userId1,
    int userId2,
  ) async {
    try {
      final request = CreateRoomRequestModel(
        userId1: userId1,
        userId2: userId2,
      );
      final httpResponse = await _chatService.createRoom(request);
      final apiResponse = httpResponse.data;

      if (apiResponse == null || apiResponse.data == null) {
        return Left(
          serverFailure("Received an empty response from the server."),
        );
      }

      final newRoom = apiResponse.data;
      return Right(newRoom!);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  Future<Either<Failures, List<Message>>> getMessagesForCurrentRoom({
    required int id,
    required int page,
    required int size,
  }) async {
    try {
      final response = await _chatService.getRoomMessages(id, page, size);
      if (response.data.data?.content == null) {
        return Left(serverFailure("No messages found or malformed response."));
      }
      return Right(response.data.data!.content!);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  Future<Either<Failures, List<RoomsOfCurrentUser>>> getRoomsOfCurrentUser({
    required int userId,
  }) async {
    try {
      final httpResponse = await _chatService.getRoomsForCurrentUser(userId);
      if (httpResponse.response.statusCode == 200 ||
          httpResponse.response.statusCode == 201) {
        final apiResponse = httpResponse.data;
        if (apiResponse.data != null) {
          return Right(apiResponse.data!);
        } else {
          return Left(serverFailure('No rooms found or malformed response.'));
        }
      } else {
        return Left(
          serverFailure(
            'Failed to load rooms. Status code: ${httpResponse.response.statusCode}',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  Future<Either<Failures, CreateRoomResponseModel>> getRoomById({
    required int roomId,
  }) async {
    try {
      final response = await _chatService.getRoom(roomId);
      if (response.response.statusCode == 200 ||
          response.response.statusCode == 201) {
        return Right(response.data);
      } else {
        return Left(
          serverFailure(
            'Failed to load room with status: ${response.response.statusCode}',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}
