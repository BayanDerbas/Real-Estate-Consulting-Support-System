import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/features/ticket/data/model/publish_ticket_request_model.dart';
import 'package:graduation_project/features/ticket/data/model/publish_ticket_response_model.dart';
import 'package:graduation_project/features/ticket/data/data_source/ticket_service/ticket_service.dart';
import '../../../../core/networks/failures.dart';
import '../model/ticket_model.dart';

class TicketRepositoryImpl {
  final TicketService _ticketService;

  TicketRepositoryImpl(this._ticketService);

  Future<Either<Failures, PublishTicketResponseModel>> createTicket(
    PublishTicketRequestModel request,
  ) async {
    try {
      final httpResponse = await _ticketService.createTicket(request);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  Future<Either<Failures, List<Ticket>>> getAllTickets({
    required int page,
    required int size,
  }) async {
    try {
      final httpResponse = await _ticketService.getAllTickets(page, size);
      final tickets = httpResponse.data.data.content;

      return Right(tickets);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}
