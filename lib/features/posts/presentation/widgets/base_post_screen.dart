import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';

class BasePostScreen extends StatelessWidget {
  const BasePostScreen({
    super.key,
    required this.child,
    this.appBarTitle,
    this.componentHeight,
  });

  final Widget child;
  final String? appBarTitle;
  final double? componentHeight;

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
            icon: Icons.notification_add,
            iconColor: Colors.white,
          ),
        ),
        body: child,
      ),
    );
  }
}
