import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../../../../core/widgets/Custom_PaginationBar.dart';
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
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

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
                    final isFavorite =
                        controller.isFavoriteList[index]?.value ?? false;
                    final isFollowing =
                        controller.isFollowingList[index]?.value ?? false;
                    final isExpanded =
                        controller.isExpandedList[index]?.value ?? false;
                    return Customoffices(
                      office:
                          '${office.user.firstName} ${office.user.lastName}',
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
                        Get.toNamed(
                          '/serviceProvider_profile',
                          arguments: {
                            'id': office.id,
                            'role': 'OFFICE',
                            'user': office.user,
                          },
                        );
                      },
                      imageUrl: office.commercialRegisterImage ?? '',
                    );
                  });
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
