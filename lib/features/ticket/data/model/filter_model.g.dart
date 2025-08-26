// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterModel _$FilterModelFromJson(Map<String, dynamic> json) => FilterModel(
  filterItems:
      (json['filterItems'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null
                    ? null
                    : FilterItemModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  globalOperator: $enumDecodeNullable(
    _$GlobalOperatorEnumEnumMap,
    json['globalOperator'],
  ),
  pageRequest:
      json['pageRequest'] == null
          ? null
          : PageRequestModel.fromJson(
            json['pageRequest'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$FilterModelToJson(FilterModel instance) =>
    <String, dynamic>{
      'filterItems': instance.filterItems,
      'globalOperator': _$GlobalOperatorEnumEnumMap[instance.globalOperator],
      'pageRequest': instance.pageRequest,
    };

const _$GlobalOperatorEnumEnumMap = {
  GlobalOperatorEnum.AND: 'AND',
  GlobalOperatorEnum.OR: 'OR',
};

FilterItemModel _$FilterItemModelFromJson(Map<String, dynamic> json) =>
    FilterItemModel(
      column: json['column'] as String?,
      value: json['value'],
      operation: $enumDecodeNullable(_$OperationEnumEnumMap, json['operation']),
      joinTable: json['joinTable'] as String?,
    );

Map<String, dynamic> _$FilterItemModelToJson(FilterItemModel instance) =>
    <String, dynamic>{
      'column': instance.column,
      'value': instance.value,
      'operation': _$OperationEnumEnumMap[instance.operation],
      'joinTable': instance.joinTable,
    };

const _$OperationEnumEnumMap = {
  OperationEnum.EQUAL: 'EQUAL',
  OperationEnum.LIKE: 'LIKE',
  OperationEnum.IN: 'IN',
  OperationEnum.GREATER_THAN: 'GREATER_THAN',
  OperationEnum.LESS_THAN: 'LESS_THAN',
  OperationEnum.BETWEEN: 'BETWEEN',
  OperationEnum.JOIN: 'JOIN',
  OperationEnum.LIKE_NAME: 'LIKE_NAME',
  OperationEnum.EQUAL_RATE: 'EQUAL_RATE',
  OperationEnum.LIKE_PROPERTY_OFFICE_NAME: 'LIKE_PROPERTY_OFFICE_NAME',
};

PageRequestModel _$PageRequestModelFromJson(Map<String, dynamic> json) =>
    PageRequestModel(
      page: (json['page'] as num?)?.toInt(),
      size: (json['size'] as num?)?.toInt(),
      sort: json['sort'] as String?,
      sortByColumn: json['sortByColumn'] as String?,
    );

Map<String, dynamic> _$PageRequestModelToJson(PageRequestModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'sort': instance.sort,
      'sortByColumn': instance.sortByColumn,
    };

PageResponseModel<T> _$PageResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PageResponseModel<T>(
  content: (json['content'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
  last: json['last'] as bool?,
  totalPages: (json['totalPages'] as num?)?.toInt(),
  totalElements: (json['totalElements'] as num?)?.toInt(),
);

Map<String, dynamic> _$PageResponseModelToJson<T>(
  PageResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'content': instance.content?.map(toJsonT).toList(),
  'last': instance.last,
  'totalPages': instance.totalPages,
  'totalElements': instance.totalElements,
};
