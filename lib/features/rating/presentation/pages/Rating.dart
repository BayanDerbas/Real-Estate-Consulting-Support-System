import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/features/rating/presentation/controllers/Rating_Controller.dart';
import 'package:graduation_project/features/rating/presentation/widgets/Custom_Rating.dart';

import '../../../../core/widgets/Custom_Button.dart';
import '../../../../core/widgets/Custom_TextButton.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    final RatingController controller = Get.put(RatingController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: CustomAppbar(
          text: "Rating",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        return Column(
          children: [
            CustomRating(
              image: AppImages.expert,
              name: "محمد محمد",
              job: "محامي",
              rating: controller.rating.value,
              onRatingChanged: controller.updateRating,
            ),
            CustomButton(
              text: "تقييم",
              backgroundColor: AppColors.deepNavy,
              textColor: AppColors.pureWhite,
              width: double.infinity,
              onPressed: () {
                print("object");
              },
            ).padding(EdgeInsets.all(18)),
            SizedBox(height: 10),
            CustomTextbutton(
              text: "ارسال تقرير عن سوء الخدمة",
              Textcolor: AppColors.grey,
              onTap: () {
                print("object");
              },
            ),
          ],
        );
      }),
    );
  }
}
