import 'package:get/get.dart';

class PostsController extends GetxController {
  var selectedIndex = (-1).obs;
  var isLiked = false.obs;
  var isDisLiked = false.obs;

  var postsList = [
    {
      'userName': 'محمد محمد',
      'userImage': 'assets/images/expert.jpg',
      'postText': '...............................................\n.....................................................',
      'postImage': 'assets/images/garden.jpg',
      'postingTime' : '19 hours ago',
      'isLiked': false.obs,
      'isDisLiked': false.obs,
    },
    {
      'userName': 'محمد محمد',
      'userImage': 'assets/images/expert.jpg',
      'postText': '...............................................\n.....................................................',
      'postImage': 'assets/images/garden.jpg',
      'postingTime' : '19 hours ago',
      'isLiked': false.obs,
      'isDisLiked': false.obs,
    },
  ].obs;


  void selectIndex(int index) {
    selectedIndex.value = index;
  }

  void toggleLike() {
    if (isDisLiked.value) {
      isLiked.value = false;
    }
    isLiked.value = !isLiked.value;
  }

  void toggleDisLike() {
    if (isLiked.value) {
      isDisLiked.value = false;
    }
    isDisLiked.value = !isDisLiked.value;
  }
}
