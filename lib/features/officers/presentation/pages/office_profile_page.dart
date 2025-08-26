import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/utils/secure_storage.dart';
import '../controllers/office_profile_controller.dart';

class ProfileExpertPage extends StatelessWidget {
  const ProfileExpertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      OfficeProfileController(Get.find(), SecureStorage()),
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ملف المكتب",
            style: Fonts.itim.copyWith(color: AppColors.pureWhite),
          ),
          backgroundColor: AppColors.deepNavy,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.pureWhite),
            onPressed: () => Get.back(),
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final profile = controller.profile.value;
          if (profile == null || profile.data == null) {
            return const Center(child: Text("لا توجد بيانات متاحة"));
          }

          final data = profile.data!;
          final user = data.user;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade200,
                  backgroundImage:
                      user?.imageUrl != null && user!.imageUrl!.isNotEmpty
                          ? NetworkImage(user.imageUrl!)
                          : null,
                  child:
                      (user?.imageUrl == null || user!.imageUrl!.isEmpty)
                          ? Image.asset(AppImages.noImage)
                          : null,
                ),
                const SizedBox(height: 12),
                Text(
                  "${user?.firstName ?? ""} ${user?.lastName ?? ""}",
                  style: Fonts.itim.copyWith(
                    fontSize: 20,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  user?.role ?? "",
                  style: Fonts.itim.copyWith(
                    fontSize: 16,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star_rate_rounded,
                      color: Colors.amber,
                      size: 28,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      (data.rating ?? 0).toString(),
                      style: Fonts.itim.copyWith(
                        fontSize: 18,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "(${data.rateCount ?? 0} تقييم)",
                      style: Fonts.itim.copyWith(
                        fontSize: 16,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on, color: AppColors.deepNavy),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        data.location ?? "غير محدد",
                        style: Fonts.itim.copyWith(
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "الوصف",
                    style: Fonts.itim.copyWith(
                      fontSize: 18,
                      color: AppColors.deepNavy,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    data.bio ?? "لا يوجد وصف متاح",
                    style: Fonts.itim.copyWith(
                      fontSize: 15,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (data.commercialRegisterImage != null &&
                    data.commercialRegisterImage!.isNotEmpty) ...[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "السجل التجاري",
                      style: Fonts.itim.copyWith(
                        fontSize: 18,
                        color: AppColors.deepNavy,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      data.commercialRegisterImage!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (_, __, ___) => Image.asset(
                            AppImages.noImage,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                    ),
                  ),
                ],
              ],
            ),
          );
        }),
      ),
    );
  }
}
