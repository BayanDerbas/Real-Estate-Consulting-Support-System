import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_PaginationBar.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../controllers/ServiceProvidersControllers.dart';
import '../widgets/CustomServiceProviderCard.dart';

class ServiceProviders extends StatelessWidget {
  const ServiceProviders({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceProviders_Controller());

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
            ? Center(child: CircularProgressIndicator())
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
                  ? Center(child: Text("لا يوجد مقدمي خدمات متاحين"))
                  : ListView.builder(
                itemCount: controller.serviceProviders.length,
                itemBuilder: (context, index) {
                  final provider = controller.serviceProviders[index];
                  return Obx(() {
                    final isFavorite = controller.isFavoriteList[index] ?? false.obs;
                    final isFollowing = controller.isFollowingList[index] ?? false.obs;
                    final isExpanded = controller.isExpandedList[index] ?? false.obs;

                    return Customserviceprovidercard(
                      index: index,
                      provider: provider,
                      onFavoriteToggle: () => controller.toggleFavorite(index),
                      onToggleExpand: () => controller.toggleExpanded(index),
                      onTap: () => print("احجز الآن"),
                      onCardTap: () {
                        final id = provider['id'];
                        Get.toNamed('/serviceProvider_profile', arguments: {
                          'id': id,
                          'role': 'EXPERT',
                        });
                      },
                      price: provider['price'] ?? 'غير محدد',
                      textProvider: provider['textProvider'] ?? 'لا يوجد وصف',
                      isFavorite: isFavorite.value,
                      isFollowing: isFollowing.value,
                      onFollowToggle: () => controller.toggleFollowing(index),
                      isExpanded: isExpanded.value,
                      imageUrl: controller.getValidImageUrl(provider),
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
        ),
      ),
    );
  }
}