import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ticket_response.g.dart';

@JsonSerializable()
class TicketResponse {
  final String status;
  final TicketData data;

  TicketResponse({required this.status, required this.data});

  factory TicketResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TicketResponseToJson(this);
}

@JsonSerializable()
class TicketData {
  final List<Ticket> content;

  final bool last;
  final int totalElements;
  final int totalPages;
  final int size;
  final int number;

  final bool first;
  final int numberOfElements;
  final bool empty;

  TicketData({
    required this.content,

    required this.last,
    required this.totalElements,
    required this.totalPages,
    required this.size,
    required this.number,

    required this.first,
    required this.numberOfElements,
    required this.empty,
  });

  factory TicketData.fromJson(Map<String, dynamic> json) =>
      _$TicketDataFromJson(json);
  Map<String, dynamic> toJson() => _$TicketDataToJson(this);
}
