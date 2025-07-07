import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';

class CustomProperties extends StatelessWidget {
  final String imagePath;
  final String place;
  final String propertyType;
  final IconData propertyIcon;
  final VoidCallback onTap;

  const CustomProperties({
    super.key,
    required this.imagePath,
    required this.place,
    required this.propertyType,
    required this.propertyIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 375,
        height: 250,
        decoration: BoxDecoration(
          color: AppColors.pureWhite,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: Stack(
                  children: [
                    buildImage(imagePath),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Transform.translate(offset: Offset(-1, 0), child: Icon(propertyIcon, size: 24, color: AppColors.black)),
                                    Transform.translate(offset: Offset(1, 0), child: Icon(propertyIcon, size: 24, color: AppColors.black)),
                                    Transform.translate(offset: Offset(0, -1), child: Icon(propertyIcon, size: 24, color: AppColors.black)),
                                    Transform.translate(offset: Offset(0, 1), child: Icon(propertyIcon, size: 24, color: AppColors.black)),

                                    Icon(propertyIcon, size: 24, color: AppColors.pureWhite),
                                  ],
                                ),
                                SizedBox(width: 5),
                                Stack(
                                    children:[
                                      Text(
                                        '$propertyType',
                                        style: Fonts.itim.copyWith(
                                          fontSize: 16,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 1
                                            ..color = AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        '$propertyType',
                                        style: Fonts.itim.copyWith(
                                          fontSize: 16,
                                          color: AppColors.pureWhite,
                                        ),
                                      ),
                                    ]
                                ),
                              ],
                            ),
                            Stack(
                              children:[
                                Text(
                                  '$place',
                                  style: Fonts.itim.copyWith(
                                    fontSize: 16,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 1
                                      ..color = AppColors.black,
                                  ),
                                ),
                                Text(
                                  '$place',
                                  style: Fonts.itim.copyWith(
                                    fontSize: 16,
                                    color: AppColors.pureWhite,
                                  ),
                                ),
                              ]
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).padding(EdgeInsets.only(top: 5,bottom: 15,));
  }

  Widget buildImage(String path) {
    if (path.startsWith('http')) {
      return Image.network(
        path,
        width: double.infinity,
        height: 260,
        fit: BoxFit.cover,
        errorBuilder:
            (context, error, stackTrace) => Image.asset(
              AppImages.villa,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
      );
    } else {
      return Image.asset(path, width: double.infinity,height: 260, fit: BoxFit.cover);
    }
  }
}
