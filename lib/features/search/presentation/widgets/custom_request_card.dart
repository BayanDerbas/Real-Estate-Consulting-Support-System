import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/styles.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';

import '../../../../core/constants/colors.dart';

class CustomRequestCard extends StatelessWidget {
  const CustomRequestCard({
    super.key,
    required this.title,
    required this.description,
    this.imagePath,
    required this.width,
    required this.height,
  });
  final String title;
  final String description;
  final String? imagePath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteCard,
        borderRadius: BorderRadius.circular(10),
      ),

      width: width,
      height: height,
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: setTextStyle(
                GoogleFonts.itim,
                16,
                AppColors.black,
                FontWeight.bold,
              ),
            ),
            subtitle: Text(
              description,
              style: setTextStyle(
                GoogleFonts.itim,
                12,
                AppColors.darkGray,
                FontWeight.bold,
              ),
            ),
            trailing:
                imagePath == null
                    ? Icon(Icons.person, size: 70)
                    : ClipRRect(
                      borderRadius: BorderRadius.circular(6),

                      child: Image.asset(
                        imagePath!,
                        fit: BoxFit.fill,
                        height: height * 0.5,
                      ),
                    ),
          ),
          Spacer(),
          CustomButton(
            text: 'Accept',
            backgroundColor: AppColors.deepNavy,
            textColor: AppColors.pureWhite,
            width: width * 0.8,
            borderRadius: 10,
          ).paddingOnly(bottom: 10),
        ],
      ),
    );
  }
}
