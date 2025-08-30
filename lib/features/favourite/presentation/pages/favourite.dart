import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../../../service provider/presentation/controllers/ServiceProvidersControllers.dart';
import '../../../service provider/presentation/widgets/CustomServiceProviderCard.dart';

class Favourite extends StatelessWidget {
  Favourite({super.key});

  final controller = Get.find<ServiceProviders_Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Favourites",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final favouriteProviders =
            controller.serviceProviders.where((provider) {
              final id = provider['id'];
              return controller.isFavoriteList[id]?.value ?? false;
            }).toList();

        if (favouriteProviders.isEmpty) {
          return const Center(child: Text("لا توجد عناصر في المفضلة حالياً"));
        }

        return ListView.builder(
          itemCount: favouriteProviders.length,
          itemBuilder: (context, index) {
            final provider = favouriteProviders[index];
            final id = provider['id'];

            return Obx(
              () => Customserviceprovidercard(
                index: index,
                provider: provider,
                role: controller.role.value,
                imageUrl: controller.getValidImageUrl(provider),
                price: provider['price'],
                textProvider: provider['textProvider'],
                isFavorite: controller.isFavoriteList[id]?.value ?? false,
                isFollowing: controller.isFollowingList[id]?.value ?? false,
                isExpanded: controller.isExpandedList[id]?.value ?? false,
                onFavoriteToggle: () => controller.toggleFavorite(id),
                onFollowToggle:
                    () =>
                        controller.isFollowingList[id]!.value
                            ? controller.unfollowExpert(id)
                            : controller.followExpert(id),
                onToggleExpand: () => controller.toggleExpanded(id),
                onTap: () {
                  print("احجز الآن");
                  final id = provider['id'];
                  Get.toNamed(
                    '/serviceProvider_profile',
                    arguments: {'id': id, 'role': 'EXPERT'},
                  );
                },
                onCardTap: () {
                  final id = provider['id'];
                  Get.toNamed(
                    '/serviceProvider_profile',
                    arguments: {'id': id, 'role': 'EXPERT'},
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
