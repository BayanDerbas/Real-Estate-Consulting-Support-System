import 'package:json_annotation/json_annotation.dart';
import 'property_model.dart';

part 'propertyData_model.g.dart';

@JsonSerializable()
class PropertyData {
  final List<PropertyModel> content;
  final Pageable? pageable;
  final bool? last;
  final int? totalElements;
  final int? totalPages;
  final int? size;
  final int? number;
  final Sort? sort;
  final bool? first;
  final int? numberOfElements;
  final bool? empty;

  PropertyData({
    required this.content,
    this.pageable,
    this.last,
    this.totalElements,
    this.totalPages,
    this.size,
    this.number,
    this.sort,
    this.first,
    this.numberOfElements,
    this.empty,
  });

  factory PropertyData.fromJson(Map<String, dynamic> json) =>
      _$PropertyDataFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyDataToJson(this);
}

@JsonSerializable()
class Pageable {
  final int? pageNumber;
  final int? pageSize;
  final Sort? sort;
  final int? offset;
  final bool? paged;
  final bool? unpaged;

  Pageable({
    this.pageNumber,
    this.pageSize,
    this.sort,
    this.offset,
    this.paged,
    this.unpaged,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) =>
      _$PageableFromJson(json);

  Map<String, dynamic> toJson() => _$PageableToJson(this);
}

@JsonSerializable()
class Sort {
  final bool? sorted;
  final bool? empty;
  final bool? unsorted;

  Sort({
    this.sorted,
    this.empty,
    this.unsorted,
  });

  factory Sort.fromJson(Map<String, dynamic> json) => _$SortFromJson(json);

  Map<String, dynamic> toJson() => _$SortToJson(this);
}

// import 'package:json_annotation/json_annotation.dart';
// import 'property_model.dart';
//
// part 'propertyData_model.g.dart';
//
// @JsonSerializable()
// class PropertyData {
//   final List<PropertyModel> content;
//
//   PropertyData({required this.content});
//
//   factory PropertyData.fromJson(Map<String, dynamic> json) =>
//       _$PropertyDataFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PropertyDataToJson(this);
// }