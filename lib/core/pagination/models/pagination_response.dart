import 'package:json_annotation/json_annotation.dart';

part 'pagination_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginationResponse<T> {
  final List<T>? content;
  final Pageable? pageable;
  final int? totalElements;
  final int? totalPages;
  final bool? last;
  final int? size;
  final int? number;
  final int? numberOfElements;
  final bool? first;
  final bool? empty;

  PaginationResponse({
    this.content,
    this.pageable,
    this.totalElements,
    this.totalPages,
    this.last,
    this.size,
    this.number,
    this.numberOfElements,
    this.first,
    this.empty,
  });

  factory PaginationResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$PaginationResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PaginationResponseToJson(this, toJsonT);
}

@JsonSerializable()
class Pageable {
  final int? pageNumber;
  final int? pageSize;
  final int? offset;
  final bool? paged;
  final bool? unpaged;

  Pageable({
    this.pageNumber,
    this.pageSize,
    this.offset,
    this.paged,
    this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);

  Map<String, dynamic> toJson() => _$PageableToJson(this);
}
