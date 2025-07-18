import 'dart:io';

import 'package:dio/dio.dart';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/networks/failures.dart';

import '../chat_service/chat_service.dart';
import '../model/create_room_request_model.dart';
import '../model/message_model.dart';
import '../model/create_room_response_model.dart';
import '../model/rooms_of_current_user.dart';

class ChatRepository {
  final ChatService _chatService;

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
      final newRoom = httpResponse.data;

      if (newRoom == null) {
        return Left(
          serverFailure("Received an empty response from the server."),
        );
      }
      print('................request create ........');
      print(request.toJson());
      return Right(newRoom);
    } catch (e) {
      return Left(serverFailure("Failed to create chat room: $e"));
    }
  }

  Future<Either<Failures, List<Message>>> getMessagesForCurrentRoom({
    required int roomId,
    required int page,
    required int size,
  }) async {
    try {
      final response = await _chatService.getRoomMessages(roomId, page, size);
      return Right(response.data);
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
      final List<RoomsOfCurrentUser> response = await _chatService
          .getRoomsOfCurrentUser(userId);
      return Right(response);
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
      if (response.response.statusCode == 200) {
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
