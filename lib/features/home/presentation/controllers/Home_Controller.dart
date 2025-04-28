import 'package:get/get.dart';

class HomeController extends GetxController{
  var selectedIndex = (-1).obs;
  var isFavorite = false.obs;
  var isFollowing = false.obs;
  var isLiked = false.obs;
  var isDisLiked = false.obs;
  var bottomNavIndex = 0.obs;
  var currentIndex = 0.obs;

  void changeBottomNavIndex(int index) {
    bottomNavIndex.value = index;
  }

  void changeIndex(int index){
    currentIndex.value = index;
  }
  // حاليا هي الليست
  var propertiesList = [
    {
      'imagePath': 'assets/images/property1.jpg',
      'title': 'Show properties 1',
    },
    {
      'imagePath': 'assets/images/property2.jpg',
      'title': 'Show properties 2',
    },
    {
      'imagePath': 'assets/images/property3.jpg',
      'title': 'Show properties 3',
    },
    {
      'imagePath': 'assets/images/property4.jpg',
      'title': 'Show properties 4',
    },
  ].obs;


  void selectIndex(int index){
    selectedIndex.value = index;
  }

  void toggleFollow() {
    isFollowing.value = !isFollowing.value;
    if (isFollowing.value) {
      print("Following is success........................");
    } else {
      print("failed.........");
    }
  }

  void toggleLike(){
    isLiked.value = !isLiked.value;
    if(isLiked.value){
      print("Like.....");
    } else {
      print("failed");
    }
  }

  void toggleUnLike() {
    isDisLiked.value = !isDisLiked.value;
    if(isDisLiked.value){
      print("Disliked");
    } else {
      print("failed");
    }
  }
}