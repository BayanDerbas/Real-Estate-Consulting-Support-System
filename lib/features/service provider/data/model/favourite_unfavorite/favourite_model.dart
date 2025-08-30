import 'package:json_annotation/json_annotation.dart';

part 'favourite_model.g.dart';

@JsonSerializable()
class FavouriteModel{
  final String? status;
  final String? data;

  FavouriteModel(this.status, this.data);

  factory FavouriteModel.fromJson(Map<String,dynamic> json) => _$FavouriteModelFromJson(json);
  Map<String,dynamic> toJson() => _$FavouriteModelToJson(this);
}