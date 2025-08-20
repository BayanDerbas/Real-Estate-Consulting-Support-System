import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';

import '../../../../core/constants/app_keys.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../../../core/utils/shard_prefs.dart';
import '../../../../core/widgets/Custom_Button.dart';
import '../controllers/refresh_token_controller.dart';

class RefreshTokenPage extends StatelessWidget {
  const RefreshTokenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RefreshTokenController>();
    controller.refreshToken();

    return Scaffold(
      body: Obx(() {
        if (controller.errMessage.isNotEmpty) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.info_outline_rounded,
                size: 128,
                color: Colors.red,
              ),
              Text("Oops !!!".tr, style: GoogleFonts.itim(fontSize: 30)),
              const SizedBox(height: 16),
              Text(
                controller.errMessage.value,
                style: GoogleFonts.itim(fontSize: 20),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: "Retry".tr,
                onPressed: () {
                  controller.refreshToken();
                },
                width: 150,
                backgroundColor: AppColors.deepNavy,
                textColor: Colors.white,
              ),
              SizedBox(height: 16),
              CustomButton(
                text: "Back To Login".tr,
                onPressed: () {
                  SharedPrefs.removeKey(AppKeys.toRoute);
                  SecureStorage().deleteToken();
                  SecureStorage().deleteRefreshToken();
                  Get.offAllNamed(AppRoutes.login);
                },
                width: 150,
                backgroundColor: Colors.red,
                textColor: Colors.white,
              ),
            ],
          ).center();
        }
        return const CircularProgressIndicator().center();
      }),
    );
  }
}
