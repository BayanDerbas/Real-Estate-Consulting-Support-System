import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = (-1).obs;
  var isFavorite = false.obs;
  var isFollowing = false.obs;
  var isLiked = false.obs;
  var isDisLiked = false.obs;
  var bottomNavIndex = 0.obs;
  var currentIndex = 0.obs;
  var hasTapped = false.obs;

  // حاليا هي الليست
  var propertiesList =
      [
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

  var postsList = [
    {
      'userName' : 'محمد محمد',
      'userImage': 'assets/images/expert.jpg',
      'postText': '...............................................\n.....................................................',
      'postImage': 'assets/images/garden.jpg',
      'isLiked': false.obs,
      'isDisLiked': false.obs,
    },
    {
      'userName' : 'محمد محمد',
      'userImage': 'assets/images/expert.jpg',
      'postText': '...............................................\n.....................................................',
      'postImage': 'assets/images/garden.jpg',
      'isLiked': false.obs,
      'isDisLiked': false.obs,
    },
  ].obs;

  void changeBottomNavIndex(int index) {
    bottomNavIndex.value = index;
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void selectIndex(int index) {
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

  void toggleLike() {
    if (isDisLiked.value) {
      isDisLiked.value = false;
    }
    isLiked.value = !isLiked.value;
  }

  void toggleUnLike() {
    if (isLiked.value) {
      isLiked.value = false;
    }
    isDisLiked.value = !isDisLiked.value;
  }
}
