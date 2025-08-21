import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/FAQs_Support/presentation/widgtes/custom_faqs.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../controllers/faqs_controller.dart';

class FAQS_support extends StatelessWidget {
  const FAQS_support({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FAQsController>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Faqs Support",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Obx(() {
          if (controller.isLoading.value && controller.items.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.errorMessage.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }
          if (controller.items.isEmpty) {
            return const Center(child: Text("لا توجد أسئلة شائعة حالياً"));
          }

          return NotificationListener<ScrollNotification>(
            onNotification: (n) {
              if (n.metrics.pixels >= n.metrics.maxScrollExtent - 200 &&
                  !controller.isLoading.value) {
                controller.getFAQs(); // pagination
              }
              return false;
            },
            child: RefreshIndicator(
              onRefresh: () => controller.getFAQs(refresh: true),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                itemCount: controller.items.length +
                    (controller.isLastPage.value ? 0 : 1),
                itemBuilder: (context, index) {
                  if (index >= controller.items.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  final faq = controller.items[index];
                  return CustomFaqs(
                    question: faq.question ?? '',
                    answer: faq.answer ?? '',
                    category: faq.category?.name,
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
