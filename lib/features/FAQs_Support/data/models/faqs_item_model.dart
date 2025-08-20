import 'package:json_annotation/json_annotation.dart';
import 'faqs_category_model.dart';

part 'faqs_item_model.g.dart';

@JsonSerializable()
class FAQItem{
  final int? id;
  final String? question;
  final String? answer;
  final FAQCategory? category;
  final String? createdAt;

  FAQItem(this.id, this.question, this.answer, this.category, this.createdAt);

  factory FAQItem.fromJson(Map<String,dynamic> json) => _$FAQItemFromJson(json);
  Map<String,dynamic> toJson() => _$FAQItemToJson(this);
}