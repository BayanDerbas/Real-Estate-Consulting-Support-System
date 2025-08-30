import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../../service provider/data/repository/follow_unfollow/follow_unfollow_repository.dart';

class HomeController extends GetxController {
  final Follow_UnFollow_Repository repository;
  var selectedIndex = (-1).obs;
  var isFavorite = false.obs;
  var isFollowing = false.obs;
  var isLiked = false.obs;
  var isDisLiked = false.obs;
  var bottomNavIndex = 0.obs;
  var currentIndex = 0.obs;
  var hasTapped = false.obs;
  var role = ''.obs;

  final SecureStorage secureStorage = SecureStorage();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  HomeController(this.repository);

  Future<void> loadRole() async {
    final storage = SecureStorage();
    role.value = await storage.getUserType() ?? '';
  }

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
