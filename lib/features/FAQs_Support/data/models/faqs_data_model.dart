import 'package:json_annotation/json_annotation.dart';
import 'faqs_item_model.dart';

part 'faqs_data_model.g.dart';

@JsonSerializable()
class FAQsData {
  final List<FAQItem>? content;
  final int? pageNumber;
  final int? pageSize;
  final bool? last;
  final int? totalElements;
  final int? totalPages;
  final bool? first;
  final int? numberOfElements;

  FAQsData(
    this.content,
    this.pageNumber,
    this.pageSize,
    this.last,
    this.totalElements,
    this.totalPages,
    this.first,
    this.numberOfElements,
  );

  factory FAQsData.fromJson(Map<String,dynamic> json) => _$FAQsDataFromJson(json);
  Map<String,dynamic> toJson() => _$FAQsDataToJson(this);
}
