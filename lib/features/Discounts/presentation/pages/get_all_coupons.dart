import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../controllers/DiscountsController.dart';
import '../widgets/Custom_CouponCard.dart';

class GetAllCoupons extends StatelessWidget {
  const GetAllCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    final DiscountsController controller = Get.find<DiscountsController>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Discounts",
          icon: Icons.notifications,
          onPressed: () {
            Get.toNamed(AppRoutes.notifications);
          },
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        if (controller.allCoupons.isEmpty) {
          return const Center(
            child: Text("لا يوجد كوبونات"),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.get_all_coupons();
          },
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.allCoupons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 4,
            ),
            itemBuilder: (context, index) {
              final coupon = controller.allCoupons[index];
              final color = CustomCouponCard.discountColors[
              index % CustomCouponCard.discountColors.length];

              return CustomCouponCard(
                code: coupon.code ?? "",
                description: coupon.description ?? "",
                discountValue: "${coupon.discountValue ?? 0} ",
                expirationDate: coupon.expirationDate,
                maxUses: coupon.maxUses,
                timesUsed: coupon.timesUsed,
                expertName: coupon.expertName,
                createdAt: coupon.createdAt,
                color: color,
              );
            },
          ),
        );
      }),
    );
  }
}
