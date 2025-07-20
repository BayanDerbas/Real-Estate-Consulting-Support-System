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
    final args = Get.arguments as Map<String, dynamic>;
    final String id = args['id'].toString();
    final String role = args['role'].toString();

    final controller = Get.put(ServiceProviderProfileController(id, role));

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
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.serviceProvider.isEmpty) {
          return const Center(child: Text("لم يتم العثور على مزود الخدمة."));
        }

        final provider = controller.serviceProvider;

        return CustomServiceproviderprofile(
          image: controller.getValidImageUrl(provider),
          name: provider['name'] ?? "بدون اسم",
          job: provider['jobTitle'] ?? "غير معروف",
          rating: provider['rating']?.toString() ?? "0",
          experience: provider['experienceYears']?.toString() ?? "0",
          successCount: provider['rateCount']?.toString() ?? "0",
          followerNum: controller.followers.value.toString(),
          followers: controller.followersText,
          onFavourite: controller.toggleFavourite,
          isFavourite: controller.isFavourite.value,
          isFollow: controller.isFollowing.value,
          onFollow: controller.toggleFollow,
          onBook: () => Get.toNamed('/Book'),
          onMessage: () {},
          followerImages: [AppImages.expert, AppImages.user],
          description: provider['textProvider'] ?? "لا يوجد وصف",
          postImages: controller.postImages,
          realEstateImages: controller.realEstateImages,
          discounts: controller.discounts,
        );
      }),
    );
  }
}
