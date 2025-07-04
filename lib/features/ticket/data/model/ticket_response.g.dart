// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketResponse _$TicketResponseFromJson(Map<String, dynamic> json) =>
    TicketResponse(
      status: json['status'] as String,
      data: TicketData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketResponseToJson(TicketResponse instance) =>
    <String, dynamic>{'status': instance.status, 'data': instance.data};

TicketData _$TicketDataFromJson(Map<String, dynamic> json) => TicketData(
  content:
      (json['content'] as List<dynamic>)
          .map((e) => Ticket.fromJson(e as Map<String, dynamic>))
          .toList(),
  last: json['last'] as bool,
  totalElements: (json['totalElements'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
  size: (json['size'] as num).toInt(),
  number: (json['number'] as num).toInt(),
  first: json['first'] as bool,
  numberOfElements: (json['numberOfElements'] as num).toInt(),
  empty: json['empty'] as bool,
);

Map<String, dynamic> _$TicketDataToJson(TicketData instance) =>
    <String, dynamic>{
      'content': instance.content,
      'last': instance.last,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'size': instance.size,
      'number': instance.number,
      'first': instance.first,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };
