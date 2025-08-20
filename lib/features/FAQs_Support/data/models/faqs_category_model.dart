import 'package:json_annotation/json_annotation.dart';

part 'faqs_category_model.g.dart';

@JsonSerializable()
class FAQCategory{
  final int? id;
  final String? name;
  final String? createdAt;

  FAQCategory(this.id, this.name, this.createdAt);
  factory FAQCategory.fromJson(Map<String,dynamic> json) => _$FAQCategoryFromJson(json);
  Map<String,dynamic> toJson() => _$FAQCategoryToJson(this);
}