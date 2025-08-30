import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../service provider/presentation/controllers/ServiceProvidersControllers.dart';
import '../../../service provider/presentation/widgets/CustomServiceProviderCard.dart';

class Followers extends StatelessWidget {
  Followers({super.key});
  final controller = Get.find<ServiceProviders_Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Followers",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final followersProviders = controller.serviceProviders.where((provider) {
          final id = provider['id'];
          return controller.isFollowingList[id]?.value ?? false;
        }).toList();

        if (followersProviders.isEmpty) {
          return const Center(
            child: Text("لا توجد عناصر في المتابعة حالياً"),
          );
        }

        return ListView.builder(
          itemCount: followersProviders.length,
          itemBuilder: (context, index) {
            final provider = followersProviders[index];
            final id = provider['id'];

            return Obx(() => Customserviceprovidercard(
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
              onFollowToggle: () => controller.isFollowingList[id]!.value
                  ? controller.unfollowExpert(id)
                  : controller.followExpert(id),
              onToggleExpand: () => controller.toggleExpanded(id),
              onTap: () {
                print("احجز الآن");
                final id = provider['id'];
                Get.toNamed(
                  '/serviceProvider_profile',
                  arguments: {
                    'id': id,
                    'role': 'EXPERT',
                  },
                );
                },
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
            ));
          },
        );
      }),
    );
  }
}
