import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit/zego_uikit.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import '../controllers/ServiceProviderProfileController.dart';
import '../widgets/Custom_ServiceProviderProfile.dart';
import 'package:graduation_project/features/officers/data/model/userOffice.dart';
import 'package:graduation_project/features/chats/presentation/controllers/room_controller.dart';

class Serviceproviderprofile extends StatelessWidget {
  const Serviceproviderprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final String id = args['id'].toString();
    final String role = args['role'].toString();
    final UserOffice? user = args['user'];
    final controller = Get.put(ServiceProviderProfileController(id, role));
    final roomController = Get.find<RoomController>();

    return Scaffold(
      floatingActionButton:
      user != null
          ? ZegoSendCallInvitationButton(
        isVideoCall: true,
        resourceID: "realEstateCons",
        invitees: [
          ZegoUIKitUser(
            id: user.id.toString(),
            name: user.firstName.toString(),
          ),
        ],
      )
          : null,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Service Provider Profile",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
          onPressed: () {
            Get.toNamed(AppRoutes.notifications);
          },
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
          onBook: role.toLowerCase() != "office"
              ? () => Get.toNamed(
            '/Book',
            arguments: {
              'id': id,
              'name': provider['name'] ?? "بدون اسم",
              'job': provider['jobTitle'] ?? "غير معروف",
              'rating': provider['rating']?.toString() ?? "0",
              'experience': provider['experienceYears']?.toString() ?? "0",
              'successCount': provider['rateCount']?.toString() ?? "0",
              'expert': provider,
            },
          )
              : null,
          onMessage: () {
            if (user != null) {
              roomController.findOrCreateRoom(user);
            } else {
              Get.snackbar(
                'Error',
                'User data is missing to start a chat.',
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          },
          onCall: () {},
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