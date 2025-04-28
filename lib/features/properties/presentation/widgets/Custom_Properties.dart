import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';

class CustomProperties extends StatelessWidget {

  final String imagePath;
  final String place;
  final String propertType;
  final IconData propertyIcon;

  CustomProperties({
    super.key,
    required this.imagePath,
    required this.place,
    required this.propertType,
    required this.propertyIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.lightGrey,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
         Image.asset(
           imagePath,
           width: double.infinity,
           height: 250,
           fit:BoxFit.cover,
         ),
          Positioned(
            left: 12,bottom: 12,
            child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place,
                style: Fonts.itim.copyWith(
                  color: AppColors.pureWhite,
                  fontSize: 20,
                  shadows:[
                    Shadow(
                      color: AppColors.black.withOpacity(0.7),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    propertyIcon,
                    size: 20,
                    color: AppColors.pureWhite,
                  ),
                  SizedBox(width: 3,),
                  Text(
                    propertType,
                    style: Fonts.itim.copyWith(
                      color: AppColors.pureWhite,
                      fontSize: 20,
                      shadows: [
                        Shadow(
                          color: AppColors.black.withOpacity(0.7),
                          blurRadius: 6,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          ),
        ],
      ),
    );
  }

}
