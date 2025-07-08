// file: lib/features/ticket/data/model/filter_tickets_request_model.dart

import 'package:json_annotation/json_annotation.dart';
part 'filter_tickets_request_model.g.dart';

@JsonSerializable()
class FilterTicketsModel {
  final double? lowPrice;
  final double? highPrice;
  final String? serviceType;
  final String? houseType;

  final String? lowArea;
  final String? highArea;

  final String? location;

  FilterTicketsModel({
    this.lowPrice,
    this.highPrice,
    this.serviceType,
    this.houseType,
    this.lowArea,
    this.highArea,
    this.location,
  });

  factory FilterTicketsModel.fromJson(Map<String, dynamic> json) =>
      _$FilterTicketsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterTicketsModelToJson(this);
}
