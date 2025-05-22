import 'package:get/get.dart';

import '../../../../core/constants/image_paths.dart';

class ServiceProviderProfileController extends GetxController{
  var isFollowing = false.obs;
  var isFavourite = false.obs;
  var followers = 18.obs;
  String get followersText => "Sara and ${followers.value - 1} others";

  final postImages = [
    AppImages.property1,
    AppImages.property2,
    AppImages.garden,
    AppImages.user,
    AppImages.expert,
    AppImages.property3,
  ];

  final realEstateImages = [
    AppImages.garden,
    AppImages.property1,
    AppImages.property4,
    AppImages.property2,
    AppImages.expert,
    AppImages.user,
  ];

  final discountImages = [
    AppImages.property2,
    AppImages.property4,
    AppImages.property3,
    AppImages.property1,
    AppImages.user,
    AppImages.expert,
  ];

  void toggleFavourite(){
    isFavourite.value = !isFavourite.value;
  }

  void toggleFollow() {
    isFollowing.value = !isFollowing.value;

    if (isFollowing.value) {
      followers.value--;
    } else {
      followers.value++;
    }
  }
}