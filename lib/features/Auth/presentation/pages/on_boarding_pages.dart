import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';
import '../controllers/on_boarding_controller.dart';
import '../widgets/custom_on_boarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  final OnBoardingController controller = Get.put(OnBoardingController());

  OnBoardingScreen({super.key}); // added constructor properly

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhite,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: const [
              CustomOnBoardingPage(
                title: "Find Your Dream Home",
                description:
                    "Browse thousands of listings easily from your phone.",
                color: AppColors.babySky,
                imagePath: AppImages.property1,
              ),
              CustomOnBoardingPage(
                title: "Best Deals",
                description: "Get amazing offers in prime locations.",
                color: AppColors.softPink,
                imagePath: AppImages.property2,
              ),
              CustomOnBoardingPage(
                title: "Easy Financing",
                description: "Financing options made simple for you.",
                color: AppColors.aquaBlue,
                imagePath: AppImages.property3,
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: controller.currentPage.value == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color:
                              controller.currentPage.value == index
                                  ? AppColors.deepNavy
                                  : AppColors.deepNavy.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: controller.skip,
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          color: AppColors.deepNavy,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: controller.nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.deepNavy,
                        foregroundColor: AppColors.pureWhite,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Next", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
