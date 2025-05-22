import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../controllers/ServiceProviderProfileController.dart';
import '../widgets/Custom_ServiceProviderProfile.dart';

class Serviceproviderprofile extends StatelessWidget {
  const Serviceproviderprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceProviderProfileController controller =
    Get.put(ServiceProviderProfileController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Service Provider Profile",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        final job = "عقارات";
        return CustomServiceproviderprofile(
          image: AppImages.expert,
          name: "محمد محمد",
          job: job,
          rating: "5",
          experience: "10",
          successCount: "20",
          followerNum: controller.followers.value.toString(),
          //followers: "sara and 17 others",
          followers: controller.followersText,
          onFavourite: controller.toggleFavourite,
          isFavourite: controller.isFavourite.value,
          isFollow: controller.isFollowing.value,
          onFollow: controller.toggleFollow,
          onBook: () {
            Get.toNamed('/Book');
          },
          onMessage: () {},
          followerImages: [
            AppImages.expert,
            AppImages.user,
          ],
          description:
          "this is my first description ton this provider , i am a lawyer to this app ,provide consultations to users who wants help in real estate",

          tabBar: TabBar(
            labelColor: AppColors.deepNavy,
            unselectedLabelColor: AppColors.grey,
            indicatorColor: Colors.transparent,
            tabs: [
              const Tab(text: 'post'),
              if (job == "عقارات") const Tab(text: 'real estate'),
              const Tab(text: 'discount'),
            ],
          ),
          tabBarView: SizedBox(
            height: 300,
            child: TabBarView(
              children: [
                // محتوى post
                GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: controller.postImages
                      .map((imagePath) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ))
                      .toList(),
                ),

                if (job == "عقارات")
                  GridView.count(
                    crossAxisCount: 3,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: controller.realEstateImages
                        .map((imagePath) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ))
                        .toList(),
                  ),

                GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: controller.discountImages
                      .map((imagePath) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ))
                      .toList(),
                ),
              ],
            ),
          ), postImages: controller.postImages, realEstateImages:controller.realEstateImages, discountImages: controller.discountImages,
        );
      }),
    );
  }
}