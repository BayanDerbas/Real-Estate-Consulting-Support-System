import 'dart:ui';

import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
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

  final List<Color> discountColors = [
    AppColors.lavender,
     AppColors.softPink,
     AppColors.babySky,
     AppColors.aquaBlue,
     AppColors.goldenYellow,
     AppColors.blushRose,
  ];

  final List<Map<String, String>> discounts = [
    {
      'discount': '%30 OFF',
      'description': 'خصم 5000 لـ سن صالح لمرة واحدة',
      'code': 'عقارك',
    },
    {
      'discount': '%100 OFF',
      'description': 'احصل على استشارة مجانية بالكامل\nبعد حجز استشارتين',
      'code': '',
    },
    {
      'discount': '%30 OFF',
      'description': 'خصم خاص على العقارات السكنية',
      'code': '',
    },
    {
      'discount': '%30 OFF',
      'description': 'خصم على خدمات التقييم العقاري',
      'code': '',
    },
    {
      'discount': '%30 OFF',
      'description': 'خصم 5000 لـ سن صالح لمرة واحدة',
      'code': 'عقارك',
    },
    {
      'discount': '%100 OFF',
      'description': 'احصل على استشارة مجانية بالكامل\nبعد حجز استشارتين',
      'code': '',
    },
    {
      'discount': '%30 OFF',
      'description': 'خصم على خدمات التقييم العقاري',
      'code': '',
    },
    {
      'discount': '%30 OFF',
      'description': 'خصم 5000 لـ سن صالح لمرة واحدة',
      'code': 'عقارك',
    },
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