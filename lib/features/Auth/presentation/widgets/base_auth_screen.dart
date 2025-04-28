import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/core/constants/colors.dart';

import '../../../../core/widgets/Custom_Appbar.dart';

class BaseAuthScreen extends StatelessWidget {
  BaseAuthScreen({
    super.key,
    required this.widget,
    this.appBarTitle,
    this.bodyText,
    this.clickableText,
    this.footerText,
    this.onTap,
  });
  final Widget widget;
  final String? appBarTitle;
  final String? bodyText;
  final String? clickableText;
  final String? footerText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: CustomAppbar(
            text: appBarTitle.toString(),
            icon: Icons.notifications,
            iconColor: Colors.white,
          ),
        ),

        body: Center(
          child: Column(
            children: [
              Container(
                height: 400,
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
                    stops: [0.0, 0.38, 0.75],
                  ),
                ),
                child: Center(child: widget),
              ).paddingOnly(top: 70, left: 20, right: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bodyText!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ).paddingOnly(right: 4),
                  Text(
                    clickableText!,

                    style: TextStyle(
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                    ),
                  ).onTap(onTap!),
                ],
              ).paddingAll(15),
              Container(
                constraints: BoxConstraints(maxWidth: width * 0.9),
                child: Text(
                  footerText!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, color: AppColors.customGray),
                ),
              ),
            ],
          ).scrollDirection(Axis.vertical),
        ),
      ),
    );
  }
}
