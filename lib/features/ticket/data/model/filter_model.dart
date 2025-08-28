import 'package:json_annotation/json_annotation.dart';

part 'filter_model.g.dart';

@JsonSerializable()
class FilterModel {
  final List<FilterItemModel?>? filterItems;
  final GlobalOperatorEnum? globalOperator;
  final PageRequestModel? pageRequest;

  FilterModel({this.filterItems, this.globalOperator, this.pageRequest});
  factory FilterModel.fromJson(Map<String, dynamic> json) =>
      _$FilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterModelToJson(this);
}

@JsonSerializable()
class FilterItemModel {
  final String? column;
  final dynamic value;
  final OperationEnum? operation;
  final String? joinTable;

  FilterItemModel({this.column, this.value, this.operation, this.joinTable});

  factory FilterItemModel.fromJson(Map<String, dynamic> json) =>
      _$FilterItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterItemModelToJson(this);
}

@JsonSerializable()
class PageRequestModel {
  final int? page;
  final int? size;
  final String? sort;
  final String? sortByColumn;

  PageRequestModel({this.page, this.size, this.sort, this.sortByColumn});

  factory PageRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PageRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PageRequestModelToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class PageResponseModel<T> {
  @JsonKey(defaultValue: [])
  final List<T>? content;
  final bool? last;
  final int? totalPages;
  final int? totalElements;

  PageResponseModel({
    this.content,
    this.last,
    this.totalPages,
    this.totalElements,
  });

  factory PageResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PageResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value) toJsonT) =>
      _$PageResponseModelToJson(this, toJsonT);
}

enum OperationEnum {
  EQUAL,
  LIKE,
  IN,
  GREATER_THAN,
  LESS_THAN,
  BETWEEN,
  JOIN,
  LIKE_NAME,
  EQUAL_RATE,
  LIKE_PROPERTY_OFFICE_NAME,
  LIKE_TICKET_CLIENT_NAME,
}

enum GlobalOperatorEnum { AND, OR }
