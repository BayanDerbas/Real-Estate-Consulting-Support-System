import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/styles.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/Custom_Button.dart';

class TabSelector extends StatelessWidget {
  final List<String> titles;
  final RxInt currentIndex;
  final void Function(int) onTabSelected;

  const TabSelector({
    super.key,
    required this.titles,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightGrey,
          boxShadow: customBoxShadow(
            x: 5,
            y: 6,
            blurRadius: 3,
            spreadRadius: 7,
          ),
        ),
        height: 60,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(titles.length, (index) {
            final isSelected = currentIndex.value == index;
            return CustomButton(
              height: 50,
              onPressed: () => onTabSelected(index),
              text: titles[index],
              backgroundColor:
                  isSelected ? AppColors.lavender : AppColors.lightGrey,
              textColor: isSelected ? AppColors.pureWhite : AppColors.black,
              // width: 110,
            );
          }),
        ),
      );
    });
  }
}
