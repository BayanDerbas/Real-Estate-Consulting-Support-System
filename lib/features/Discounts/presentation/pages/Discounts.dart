import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';

class Discounts extends StatelessWidget {
  const Discounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: CustomAppbar(
          text: 'Manage discounts',
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
    );
  }
}
