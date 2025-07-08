// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_tickets_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterTicketsResponseModel _$FilterTicketsResponseModelFromJson(
  Map<String, dynamic> json,
) => FilterTicketsResponseModel(
  status: json['status'] as String,
  data:
      (json['data'] as List<dynamic>)
          .map((e) => TicketDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$FilterTicketsResponseModelToJson(
  FilterTicketsResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
