// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponse<T> _$PaginationResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginationResponse<T>(
  content: (json['content'] as List<dynamic>?)?.map(fromJsonT).toList(),
  pageable:
      json['pageable'] == null
          ? null
          : Pageable.fromJson(json['pageable'] as Map<String, dynamic>),
  totalElements: (json['totalElements'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
  last: json['last'] as bool?,
  size: (json['size'] as num?)?.toInt(),
  number: (json['number'] as num?)?.toInt(),
  numberOfElements: (json['numberOfElements'] as num?)?.toInt(),
  first: json['first'] as bool?,
  empty: json['empty'] as bool?,
);

Map<String, dynamic> _$PaginationResponseToJson<T>(
  PaginationResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'content': instance.content?.map(toJsonT).toList(),
  'pageable': instance.pageable,
  'totalElements': instance.totalElements,
  'totalPages': instance.totalPages,
  'last': instance.last,
  'size': instance.size,
  'number': instance.number,
  'numberOfElements': instance.numberOfElements,
  'first': instance.first,
  'empty': instance.empty,
};

Pageable _$PageableFromJson(Map<String, dynamic> json) => Pageable(
  pageNumber: (json['pageNumber'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  offset: (json['offset'] as num?)?.toInt(),
  paged: json['paged'] as bool?,
  unpaged: json['unpaged'] as bool?,
);

Map<String, dynamic> _$PageableToJson(Pageable instance) => <String, dynamic>{
  'pageNumber': instance.pageNumber,
  'pageSize': instance.pageSize,
  'offset': instance.offset,
  'paged': instance.paged,
  'unpaged': instance.unpaged,
};
