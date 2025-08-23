import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/Fonts.dart';
import '../constants/colors.dart';

class CustomAppbar extends StatelessWidget {
  final String text;
  final Color textColor;
  final IconData icon;
  final Color iconColor;
  final Color appbarColor;
  final void Function()? onPressed;

  const CustomAppbar({
    super.key,
    required this.text,
    this.textColor = AppColors.pureWhite,
    required this.icon,
    this.iconColor = AppColors.pureWhite,
    this.appbarColor = AppColors.deepNavy,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SlantedClipper(),
      child: Container(
        width: double.infinity,
        height: 140,
        color: appbarColor,
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: Fonts.itim.copyWith(color: textColor, fontSize: 20),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(icon, color: iconColor),
                ),
              ],
            )
            .paddingOnly(bottom: 30, left: 20, right: 20, top: 20)
            .marginOnly(bottom: 0),
      ),
    );
  }
}

class SlantedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
