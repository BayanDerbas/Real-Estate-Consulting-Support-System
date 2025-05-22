import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
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
                  "200+",
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
              child: ListView.builder(
                itemCount: controller.serviceProviders.length,
                itemBuilder: (context, index) {
                  final provider = controller.serviceProviders[index];
                  return Customserviceprovidercard(
                    index: index,
                    provider: provider,
                    onFavoriteToggle: () => controller.toggleFavorite(index),
                    onToggleExpand: () => controller.toggleExpanded(index),
                    onTap: () {
                      print("تم الضغط على زر احجز الآن لـ ${provider['name']}");
                    },
                    onCardTap: (){
                      Get.toNamed('/profile',arguments: provider);
                    },
                    pricre: provider['price'],
                    textProvider:provider['textProvider'],
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
