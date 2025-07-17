import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/routes/routes.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../controllers/OfficeController.dart';
import '../widgets/CustomOffices.dart';

class Offices extends StatelessWidget {
  final OfficeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "offices",
          icon: Icon(Icons.notifications),
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.officesList.length,
          itemBuilder: (context, index) {
            return Obx(() {
              final office = controller.officesList[index];
              final state =
                  controller.officeStates[index] ??
                  {
                    "isFavorite": false,
                    "isFollowing": false,
                    "isExpanded": false,
                  };

              return Customoffices(
                office:
                    office.user.firstName +
                    office.user.lastName, // ملاحظة: عدلتها من lastname+lastname
                location: office.location ?? '',
                bio: "الوصف : ${office.bio ?? ''}",
                imageUrl: office.user.imageUrl ?? '',
                isFavorite: state["isFavorite"]!,
                isFollowing: state["isFollowing"]!,
                isExpanded: state["isExpanded"]!,
                onFavoriteToggle: () => controller.toggleFavorite(index),
                onFollowToggle: () => controller.toggleFollow(index),
                onToggleExpand: () => controller.toggleExpand(index),
                onTap: () {
                  print("oooooooooooooooooooooooooo");
                  Get.toNamed(AppRoutes.chatPage, arguments: office.user);
                  //open chat with this office
                  print("زيارة ملف المكتب: ${office.user.toJson()}");
                },
              );
            });
          },
        ),
      ),
    );
  }
}
