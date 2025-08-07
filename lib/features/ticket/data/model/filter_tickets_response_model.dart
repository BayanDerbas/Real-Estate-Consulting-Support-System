import 'package:graduation_project/features/Auth/data/model/client_model.dart';
import 'package:graduation_project/features/ticket/data/model/publish_ticket_response_model.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_data_model.dart';
import 'package:graduation_project/features/ticket/data/model/ticket_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'filter_tickets_response_model.g.dart';

@JsonSerializable()
class FilterTicketsResponseModel {
  final String? status;
  final List<Ticket>? data;

  FilterTicketsResponseModel({required this.status, required this.data});

  factory FilterTicketsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FilterTicketsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterTicketsResponseModelToJson(this);
}
