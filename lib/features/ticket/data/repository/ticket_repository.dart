import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/features/ticket/data/model/filter_tickets_request_model.dart';
import 'package:graduation_project/features/ticket/data/model/publish_ticket_request_model.dart';
import 'package:graduation_project/features/ticket/data/model/publish_ticket_response_model.dart';
import 'package:graduation_project/features/ticket/data/data_source/ticket_service/ticket_service.dart';
import '../../../../core/networks/failures.dart';
import '../model/filter_model.dart';
import '../model/ticket_model.dart';
import '../model/ticket_response.dart';

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

  Future<Either<Failures, PublishTicketResponseModel>> updateTicket(
    int id,
    PublishTicketRequestModel request,
  ) async {
    try {
      final httpResponse = await _ticketService.updateTicket(id, request);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  Future<Either<Failures, void>> deleteTicket(int ticketId) async {
    try {
      final response = await _ticketService.deleteTicket(ticketId);
      if (response.response.statusCode == 200 ||
          response.response.statusCode == 204) {
        return const Right(null);
      } else {
        return Left(
          serverFailure(
            'Failed to delete ticket. Status code: ${response.response.statusCode}',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  // In your TicketRepositoryImpl class

  Future<Either<Failures, List<Ticket>>> getFilteredTickets({
    required FilterTicketsModel filter,
  }) async {
    try {
      final httpResponse = await _ticketService.getFilteredTickets(
        lowPrice: filter.lowPrice,
        highPrice: filter.highPrice,
        serviceType: filter.serviceType,
        houseType: filter.houseType,
        lowArea: filter.lowArea,
        highArea: filter.highArea,
        location: filter.location,
      );
      final tickets = httpResponse.data.data;
      return Right(tickets!);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }

  Future<Either<Failures, TicketResponse>> filterTickets(
    FilterModel filter,
  ) async {
    try {
      final httpResponse = await _ticketService.filterTickets(filter);
      return Right(httpResponse.data);
    } on DioException catch (e) {
      return Left(serverFailure.fromDioError(e));
    } catch (e) {
      return Left(serverFailure(e.toString()));
    }
  }
}
