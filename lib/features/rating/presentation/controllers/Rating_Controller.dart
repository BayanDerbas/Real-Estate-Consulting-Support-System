import 'package:get/get.dart';

class RatingController extends GetxController{
  var rating = 3.0.obs;

  void updateRating(double newRating){
    rating.value = newRating;
  }
}