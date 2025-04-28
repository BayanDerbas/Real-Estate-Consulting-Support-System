import 'package:flutter/material.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import 'package:graduation_project/core/constants/colors.dart';

import '../../../../core/widgets/Custom_Appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150), // Height of the AppBar
        child: CustomAppbar(
          text: "Slanted AppBar", // Text on the left side
          icon: Icons.notifications, // Icon on the right side
          iconColor: Colors.white, // Color of the icon
        ),
      ),

      body: Center(
        child: CustomButton(
          text: 'hello everyone',
          backgroundColor: AppColors.purple,
          textColor: AppColors.pureWhite,
          width: 200,
        ),
      ),
    );
  }
}
