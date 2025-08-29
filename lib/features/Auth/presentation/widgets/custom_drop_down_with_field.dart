import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/Fonts.dart';

import '../../../ticket/data/model/ticket_model.dart'; // لو تستخدم نفس الستايلات

class CustomDropDownWithField extends StatelessWidget {
  const CustomDropDownWithField({
    super.key,

    required this.list,
    required this.item,
    required this.onChanged,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;
  final List<EnumModel> list;
  final Rx<Enum> item;
  final ValueChanged<Enum?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Container(
            width: width ?? double.infinity,
            height: height ?? 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.pureWhite.withOpacity(0.36),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Enum>(
                isExpanded: true,
                value: item.value,
                style: Fonts.hintTextStyle,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.pureWhite,
                ),
                items:
                    list
                        .map(
                          (EnumModel dropdownItem) => DropdownMenuItem<Enum>(
                            value: dropdownItem.value,
                            child: Text(
                              dropdownItem.label.tr,
                              style: Fonts.contentTextFieldStyle,
                            ),
                          ),
                        )
                        .toList(),
                onChanged: onChanged,
                dropdownColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 10, horizontal: 5);
  }
}
