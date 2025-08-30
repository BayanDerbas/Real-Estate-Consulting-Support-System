import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../controllers/ServiceProvidersControllers.dart';
import '../widgets/CustomServiceProviderCard.dart';

class ServiceProviders extends StatelessWidget {
  const ServiceProviders({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ServiceProviders_Controller>();
    final storage = SecureStorage();

    return FutureBuilder<String?>(
      future: storage.getUserType(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final role = snapshot.data ?? '';

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(150),
            child: CustomAppbar(
              text: "service provider",
              icon: Icons.notifications,
              iconColor: AppColors.pureWhite,
            ),
          ),
          body: Obx(
                () => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.home_outlined,
                      color: AppColors.darkGray,
                      size: 30,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      "${controller.serviceProviders.length}+",
                      style: Fonts.itim.copyWith(
                        color: AppColors.darkGray,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Text(
                  "available service providers",
                  style: Fonts.itim.copyWith(
                    color: AppColors.grey,
                    fontSize: 18,
                  ),
                ).padding(const EdgeInsets.only(bottom: 5)),
                Expanded(
                  child: controller.serviceProviders.isEmpty
                      ? const Center(
                    child: Text("لا يوجد مقدمي خدمات متاحين"),
                  )
                      : ListView.builder(
                    itemCount: controller.serviceProviders.length,
                    itemBuilder: (context, index) {
                      final provider =
                      controller.serviceProviders[index];

                      return Obx(() {
                        final expertId = provider['id'] as int;
                        final isFavorite = controller.isFavoriteList[expertId] ?? false.obs;
                        final isFollowing = controller.isFollowingList[expertId] ?? false.obs;
                        final isExpanded = controller.isExpandedList[expertId] ?? false.obs;

                        return Customserviceprovidercard(
                          index: index,
                          provider: provider,
                          onToggleExpand: () => controller.toggleExpanded(index),
                          onTap: () => print("احجز الآن"),
                          onCardTap: () {
                            final id = provider['id'];
                            Get.toNamed(
                              '/serviceProvider_profile',
                              arguments: {
                                'id': id,
                                'role': 'EXPERT',
                              },
                            );
                          },
                          price: provider['price'] ?? 'غير محدد',
                          textProvider: provider['textProvider'] ?? 'لا يوجد وصف',
                          onFavoriteToggle: () async {
                            await controller.toggleFavorite(expertId);
                          },
                          isFavorite: isFavorite.value,
                          isFollowing: isFollowing.value,
                          onFollowToggle: () async {
                            if (isFollowing.value) {
                              await controller.unfollowExpert(expertId);
                            } else {
                              await controller.followExpert(expertId);
                            }
                          },

                          // onFollowToggle: () {
                          //   final id = provider['id'] as int;
                          //   isFollowing.value = !isFollowing.value;
                          //
                          //   if (isFollowing.value) {
                          //     controller.followExpert(id).catchError((e) {
                          //       isFollowing.value = !isFollowing.value;
                          //       Get.snackbar('Error', 'فشل في المتابعة');
                          //     });
                          //   } else {
                          //     controller.unfollowExpert(id).catchError((e) {
                          //       isFollowing.value = !isFollowing.value;
                          //       Get.snackbar('Error', 'فشل في إلغاء المتابعة');
                          //     });
                          //   }
                          // },
                          isExpanded: isExpanded.value,
                          imageUrl: controller.getValidImageUrl(provider),
                          role: role,
                        );
                      });
                    },
                  ),
                ),
                //   CustomPaginationBar(
                //   totalPages: controller.totalPages.value,
                //   currentPage: controller.currentPage.value,
                //   onPageSelected: (int newPage) {
                //     controller.changePage(newPage);
                //   },
                // ).scrollDirection(Axis.horizontal),
              ],
            ),
          ),
        );
      },
    );
  }
}
