import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';

class BasePostScreen extends StatelessWidget {
  const BasePostScreen({
    super.key,
    required this.child,
    this.appBarTitle,
    this.heightOfAppBar,

    this.onBack,
  });

  final Widget child;
  final String? appBarTitle;
  final double? heightOfAppBar;
  final Function? onBack;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(heightOfAppBar!),
          child: CustomAppbar(
            text: appBarTitle ?? '',
            onBackButtonPressed: () {
              print('pressed back');
              onBack != null ? onBack!() : Get.back();
            },
            onPressed: () {
              Get.back();
            },
            icon: Icons.notification_add,
            iconColor: Colors.white,
          ),
        ),
        body: child,
      ),
    );
  }
}
