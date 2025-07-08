import 'package:flutter/material.dart';

import '../../../../core/widgets/Custom_Appbar.dart';

class BaseSearchScreen extends StatelessWidget {
  const BaseSearchScreen({
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
            icon: Icon(Icons.notifications),
            iconColor: Colors.white,
          ),
        ),

        body: Center(child: widget),
      ),
    );
  }
}
