import 'dart:math';

import 'package:get/get.dart';

class propertyDetailsController extends GetxController{
  RxInt selectedImageIndex = 0.obs;

  void changeImage(int index){
    selectedImageIndex.value = index;
  }

  void nextImage(int max) {
    if (selectedImageIndex < max - 1) {
      selectedImageIndex++;
    }
  }

  void previousImage(int index){
    if(selectedImageIndex > 0){
      selectedImageIndex--;
    }
  }

}