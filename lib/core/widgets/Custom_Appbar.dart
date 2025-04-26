import 'package:flutter/material.dart';
import '../constants/Fonts.dart';
import '../constants/colors.dart';

class CustomAppbar extends StatelessWidget {
  final String text;
  final Color textColor;
  final IconData icon;
  final Color iconColor;
  final Color appbarColor;

  const CustomAppbar({
    super.key,
    required this.text,
    this.textColor = colors.pureWhite,
    required this.icon,
    required this.iconColor,
    this.appbarColor = colors.deepNavy,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SlantedClipper(),
      child: Container(
        width: double.infinity,
        height: 150,
        color: appbarColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Fonts.itim.copyWith(
                  color: textColor,
                  fontSize: 20,
                ),
              ),
              Icon(
                icon,
                color: iconColor,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlantedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0); // Top left
    path.lineTo(size.width, size.height - 30); // Slanted point on the right
    path.lineTo(0, size.height); // Bottom left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
