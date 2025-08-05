// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_of_current_room_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesOfCurrentRoomResponse _$MessagesOfCurrentRoomResponseFromJson(
  Map<String, dynamic> json,
) => MessagesOfCurrentRoomResponse(
  status: json['status'] as String?,
  data:
      json['data'] == null
          ? null
          : MessagesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MessagesOfCurrentRoomResponseToJson(
  MessagesOfCurrentRoomResponse instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

MessagesData _$MessagesDataFromJson(Map<String, dynamic> json) => MessagesData(
  content:
      (json['content'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
  pageable:
      json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
  last: json['last'] as bool?,
  totalElements: (json['totalElements'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
  size: (json['size'] as num?)?.toInt(),
  number: (json['number'] as num?)?.toInt(),
  sort:
      json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
  first: json['first'] as bool?,
  numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
  empty: json['empty'] as bool?,
);

Map<String, dynamic> _$MessagesDataToJson(MessagesData instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'last': instance.last,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
      'first': instance.first,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
  pageNumber: (json['pageNumber'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  sort:
      json['sort'] == null
          ? null
          : Sort.fromJson(json['sort'] as Map<String, dynamic>),
  offset: (json['offset'] as num?)?.toInt(),
  paged: json['paged'] as bool?,
  unpaged: json['unpaged'] as bool?,
);

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
  'sort': instance.sort,
  'offset': instance.offset,
  'paged': instance.paged,
  'unpaged': instance.unpaged,
};

Sort _$SortFromJson(Map<String, dynamic> json) => Sort(
  sorted: json['sorted'] as bool?,
  empty: json['empty'] as bool?,
  unsorted: json['unsorted'] as bool?,
);

Map<String, dynamic> _$SortToJson(Sort instance) => <String, dynamic>{
  'sorted': instance.sorted,
  'empty': instance.empty,
  'unsorted': instance.unsorted,
};
