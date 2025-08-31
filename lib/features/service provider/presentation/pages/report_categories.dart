import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/fonts.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../controllers/report_categories_controller.dart';
import '../widgets/report_category_tile.dart';
import '../../data/model/report/report_category_model.dart';

class ReportCategoriesPage extends StatelessWidget {
  const ReportCategoriesPage({super.key});

  void _showReportDialog(
      BuildContext context,
      int categoryId,
      int? reportedId,
      String reportedRole,
      ) {
    if (reportedId == null) {
      Get.snackbar(
        'خطأ',
        'معرف المستخدم المبلغ عنه غير متوفر',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final TextEditingController textController = TextEditingController();
    final controller = Get.find<ReportCategoriesController>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          "إرسال بلاغ",
          style: Fonts.itim.copyWith(
            color: AppColors.deepNavy,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: TextField(
          controller: textController,
          maxLines: 4,
          style: Fonts.itim.copyWith(color: AppColors.deepNavy),
          decoration: InputDecoration(
            hintText: "اكتب تفاصيل البلاغ هنا",
            hintStyle: Fonts.itim.copyWith(color: AppColors.deepNavy.withOpacity(0.5)),
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "إلغاء",
              style: Fonts.itim.copyWith(color: AppColors.deepNavy),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.deepNavy,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () async {
              final text = textController.text.trim();
              if (text.isEmpty) return;

              await controller.sendReport(
                categoryId: categoryId,
                description: text,
                reportedUserId: reportedId,
              );

              Navigator.pop(context);

              if (controller.sendSuccess.value) {
                Get.snackbar(
                  "تم الإرسال",
                  "تم إرسال بلاغك بنجاح",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: AppColors.deepNavy,
                );
              } else {
                Get.snackbar(
                  "خطأ",
                  controller.sendError.value ?? "حدث خطأ غير متوقع",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: AppColors.deepNavy,
                );
              }
            },
            child: Text(
              "إرسال",
              style: Fonts.itim.copyWith(color: AppColors.pureWhite),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ReportCategoriesController>();

    final args = Get.arguments as Map<String, dynamic>? ?? {};
    final int? reportedId = args['reportedId'] != null ? int.tryParse(args['reportedId'].toString()) : null;
    print("DEBUG: received reportedId = $reportedId");
    final String reportedRole = args['reportedRole']?.toString() ?? "";

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Report",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
          onPressed: () {
            Get.toNamed(AppRoutes.notifications);
          },
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.value != null) {
          return Center(
            child: Text(
              controller.error.value!,
              style: Fonts.itim.copyWith(color: AppColors.deepNavy),
            ),
          );
        }
        if (controller.categories.isEmpty) {
          return Center(
            child: Text(
              'لا توجد تصنيفات',
              style: Fonts.itim.copyWith(color: AppColors.deepNavy),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.categories.length,
          itemBuilder: (_, i) {
            final ReportCategory category = controller.categories[i];
            return ReportCategoryTile(
              category: category,
              onTap: () => _showReportDialog(
                context,
                category.id,
                reportedId,
                reportedRole,
              ),
            );
          },
        );
      }),
    );
  }
}