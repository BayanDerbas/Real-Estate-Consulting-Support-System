import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/Custom_Appbar.dart';

class BaseAuthScreen extends StatelessWidget {
  const BaseAuthScreen({
    super.key,
    required this.widget,
    this.appBarTitle,
    this.bodyText,
    this.clickableText,
    this.footerText,
    this.onTap,
    this.componentHeight,
  });

  final Widget widget;
  final String? appBarTitle;
  final String? bodyText;
  final String? clickableText;
  final String? footerText;
  final double? componentHeight;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: CustomAppbar(
            text: appBarTitle ?? '',
<<<<<<< HEAD
            icon: Icons.notification_add,
=======
            icon: const Icon(
              Icons.notification_add,
              color: AppColors.pureWhite,
            ),
>>>>>>> c7d731dd450c376d00dc6594eb046f0831d21a99
            iconColor: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: componentHeight,
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.skyBlue,
                      AppColors.lightBulishGray,
                      AppColors.softPink2,
                    ],
                    begin: Alignment.topLeft,
                    stops: const [0.0, 0.38, 0.75],
                  ),
                ),
                child: Center(child: widget),
              ).paddingOnly(top: 50, left: 20, right: 20, bottom: 20),
              if (bodyText != null && clickableText != null && onTap != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bodyText!,
                      textAlign: TextAlign.center,
                      style: Fonts.itim.copyWith(
                        color: AppColors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ).paddingOnly(right: 4),
                    Text(
                      clickableText!,
                      style: Fonts.itim.copyWith(
                        color: AppColors.black,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ).onTap(onTap!),
                  ],
                ).paddingSymmetric(horizontal: 15, vertical: 5),
              if (footerText != null)
                Container(
                  constraints: BoxConstraints(maxWidth: width * 0.9),
                  child: Text(
                    footerText!,
                    textAlign: TextAlign.center,
                    style: Fonts.itim.copyWith(
                      color: AppColors.grey,
                      fontSize: 17,
                    ),
                  ),
                ).paddingOnly(bottom: 20),
            ],
          ),
        ),
      ),
    );
  }
}
