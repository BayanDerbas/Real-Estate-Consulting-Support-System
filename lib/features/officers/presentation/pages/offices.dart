import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:graduation_project/core/extensions/widget_extension.dart';
=======
import 'package:graduation_project/core/routes/routes.dart';
>>>>>>> c7d731dd450c376d00dc6594eb046f0831d21a99
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
<<<<<<< HEAD
import '../../../../core/widgets/Custom_PaginationBar.dart';
=======
import '../../../Auth/data/model/user_model.dart';
import '../../../chats/presentation/controllers/room_controller.dart';
>>>>>>> c7d731dd450c376d00dc6594eb046f0831d21a99
import '../controllers/OfficeController.dart';
import '../widgets/CustomOffices.dart';

class Offices extends StatelessWidget {
  final OfficeController controller = Get.find();
  final RoomController roomController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "offices",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

<<<<<<< HEAD
        if (controller.officesList.isEmpty) {
          return const Center(child: Text("لا توجد مكاتب متاحة"));
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.officesList.length,
                itemBuilder: (context, index) {
                  final office = controller.officesList[index];
                  return Obx(() {
                    final isFavorite = controller.isFavoriteList[index]?.value ?? false;
                    final isFollowing = controller.isFollowingList[index]?.value ?? false;
                    final isExpanded = controller.isExpandedList[index]?.value ?? false;
                    return Customoffices(
                      office: '${office.user.firstName} ${office.user.lastName}',
                      location: office.location ?? 'غير محدد',
                      bio: office.bio ?? 'لا يوجد وصف',
                      isFavorite: isFavorite,
                      isFollowing: isFollowing,
                      isExpanded: isExpanded,
                      onFavoriteToggle: () {
                        controller.toggleFavorite(index);
                        print("onFavoriteToggle called for index: $index");
                      },
                      onFollowToggle: () {
                        controller.toggleFollow(index);
                        print("onFollowToggle called for index: $index");
                      },
                      onToggleExpand: () {
                        controller.toggleExpand(index);
                        print("onToggleExpand called for index: $index");
                      },
                      onTap: () {
                        print("زيارة ملف المكتب: ${office.user.id}");
                        Get.toNamed('/serviceProvider_profile', arguments: {
                          'id': office.id,
                          'role': 'OFFICE',
                        });
                      },
                      imageUrl: office.commercialRegisterImage ?? '',
                    );
                  });
=======
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
                  final userToChatWith = UserModel(
                    id: office.user.id,
                    firstName: office.user.firstName,
                    lastName: office.user.lastName,
                    email: office.user.email,
                    phone: office.user.phone,
                  );

                  roomController.createOrGoToChat(userToChatWith);
                  //open chat with this office
                  print("زيارة ملف المكتب: ${office.user.toJson()}");
>>>>>>> c7d731dd450c376d00dc6594eb046f0831d21a99
                },
              ),
            ),
            CustomPaginationBar(
              totalPages: controller.totalPages.value,
              currentPage: controller.currentPage.value,
              onPageSelected: (int newPage) {
                controller.changePage(newPage);
              },
            ).scrollDirection(Axis.horizontal),
          ],
        );
      }),
    );
  }
}