import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_PaginationBar.dart';
import 'package:graduation_project/core/widgets/custom_search_text_field.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../../../filter/controllers/service_providers_filter_controller.dart';
import '../../../ticket/data/model/filter_model.dart';
import '../controllers/ServiceProvidersControllers.dart';
import '../widgets/CustomServiceProviderCard.dart';

class ServiceProviders extends StatelessWidget {
  ServiceProviders({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ServiceProviders_Controller>();
    final filterController = Get.put(ServiceProvidersFilterController());
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
        () => Column(
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
                  "${controller.totalElements.value}+",
                  style: Fonts.itim.copyWith(
                    color: AppColors.darkGray,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text(
              "available service providers",
              style: Fonts.itim.copyWith(color: AppColors.grey, fontSize: 18),
            ).padding(const EdgeInsets.only(bottom: 5)),
            Expanded(
              child: Obx(() {
                if (controller.serviceProviders.isEmpty) {
                  return Center(child: Text("لا يوجد مقدمي خدمات متاحين"));
                }
                if (controller.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(
                      controller.errorMessage.value,
                      style: GoogleFonts.itim(color: AppColors.red),
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () => controller.filter(),
                  child: ListView.builder(
                    controller: controller.scrollController,
                    itemCount:
                        controller.length + (controller.last.isFalse ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (controller.last.isFalse &&
                          index == controller.length) {
                        if (controller.isLoading.value) {
                          return Container(
                            height: 60,
                            child: const CircularProgressIndicator().center(),
                          );
                        }
                        return const SizedBox();
                      }

                      final provider = controller.serviceProviders[index];
                      return Obx(() {
                        final expertId = provider['id'] as int;
                        final isFavorite =
                            controller.isFavoriteList[expertId] ?? false.obs;
                        final isFollowing =
                            controller.isFollowingList[expertId] ?? false.obs;
                        final isExpanded =
                            controller.isExpandedList[expertId] ?? false.obs;

                        return Customserviceprovidercard(
                          index: index,
                          provider: provider,
                          onToggleExpand:
                              () => controller.toggleExpanded(index),
                          onTap: () => print("احجز الآن"),
                          onCardTap: () {
                            final id = provider['id'];
                            Get.toNamed(
                              '/serviceProvider_profile',
                              arguments: {'id': id, 'role': 'EXPERT'},
                            );
                          },
                          price: provider['price'] ?? 'غير محدد',
                          textProvider:
                              provider['textProvider'] ?? 'لا يوجد وصف',
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

                          isExpanded: isExpanded.value,
                          imageUrl: controller.getValidImageUrl(provider),
                          role: controller.role.value,
                        );
                      });
                    },
                  ),
                );
                //   CustomPaginationBar(
                //   totalPages: controller.totalPages.value,
                //   currentPage: controller.currentPage.value,
                //   onPageSelected: (int newPage) {
                //     controller.changePage(newPage);
                //   },
                // ).scrollDirection(Axis.horizontal),
              }),
            ),
          ],
        ),
      ),
    );
  }
}
