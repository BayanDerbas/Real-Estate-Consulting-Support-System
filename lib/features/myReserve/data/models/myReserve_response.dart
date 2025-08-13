import 'package:graduation_project/features/Book/data/model/booking_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'myReserve_response.g.dart';

@JsonSerializable()
class MyReserveResponse{
  final String status;
  final List<BookingData>? data;

  MyReserveResponse(this.status, this.data);

 factory MyReserveResponse.fromJson(Map<String,dynamic> json) => _$MyReserveResponseFromJson(json);
 Map<String,dynamic> toJson() => _$MyReserveResponseToJson(this);
}