import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';
import '../../../../core/constants/styles.dart';

class CustomAppointmentCard extends StatelessWidget {
  const CustomAppointmentCard({
    super.key,
    required this.name,
    required this.date,
    required this.time,
    required this.image,
    required this.iconPath,
  });
  final String name;
  final String date;
  final String time;
  final String image;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.whiteCard,
        boxShadow: customBoxShadow(x: 6, y: 7, blurRadius: 10, spreadRadius: 5),
      ),
      height: 140,
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              AppImages.property1,
              height: 84,
              width: 84,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: setTextStyle(
                  GoogleFonts.itim,
                  16,
                  AppColors.black,
                  FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Date : ",
                    style: setTextStyle(
                      GoogleFonts.itim,
                      12,
                      AppColors.black,
                      FontWeight.normal,
                    ),
                  ),
                  Text(
                    date,
                    style: setTextStyle(
                      GoogleFonts.itim,
                      12,
                      AppColors.purple,
                      FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Time : ",
                    style: setTextStyle(
                      GoogleFonts.itim,
                      12,
                      AppColors.black,
                      FontWeight.normal,
                    ),
                  ),
                  Text(
                    time,
                    style: setTextStyle(
                      GoogleFonts.itim,
                      12,
                      AppColors.purple,
                      FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ).paddingOnly(top: 22, left: 5),
          SizedBox(width: 60.0),
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.purple,

              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipOval(
              child: Icon(Icons.call, size: 30, color: AppColors.pureWhite),
            ),
          ),
        ],
      ),
    ).marginAll(5).paddingAll(5);
  }
}
