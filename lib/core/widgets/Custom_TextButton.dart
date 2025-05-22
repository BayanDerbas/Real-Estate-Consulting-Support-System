import 'package:flutter/material.dart';

import '../constants/Fonts.dart';

class CustomTextbutton extends StatelessWidget {
  final String text;
  final Color Textcolor;
  final VoidCallback? onTap;

  const CustomTextbutton({
    super.key,
    required this.text,
    required this.Textcolor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: Fonts.itim.copyWith(color: Textcolor,fontSize: 16,),
      ),
    );
  }
}
