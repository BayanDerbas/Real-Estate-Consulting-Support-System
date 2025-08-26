import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/styles.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/features/filter/controllers/ticket_filter_controller.dart';

class ChipsCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<ChipModel> list;
  final RxList<ChipModel> selectedList;
  final bool moreSelectedItem;

  const ChipsCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.list,
    required this.selectedList,
    this.moreSelectedItem = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: customBoxShadow(
          x: 0,
          y: 4,
          blurRadius: 4,
          spreadRadius: 0,
          color: Colors.black.withOpacity(.25),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(title, style: GoogleFonts.itim(fontSize: 26)),
              if (subtitle != null)
                Text(
                  " ($subtitle)",
                  style: GoogleFonts.itim(
                    fontSize: 16,
                    color: Color(0xff8E8E8E),
                  ),
                ),
            ],
          ).paddingSymmetric(horizontal: 16),
          SizedBox(height: 16),
          CustomChipWrapper(
            list: list,
            selectedList: selectedList,
            moreSelectedItem: moreSelectedItem,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class CustomChipWrapper extends StatelessWidget {
  const CustomChipWrapper({
    super.key,
    required this.list,
    required this.selectedList,
    required this.moreSelectedItem,
  });

  final List<ChipModel> list;
  final RxList<ChipModel> selectedList;
  final bool moreSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        children:
            list.map((e) {
              bool isSelected = selectedList.any(
                (element) => element.label == e.label,
              );
              return Chip(
                    label: Text(
                      e.label,
                      style: GoogleFonts.itim(
                        fontSize: 18,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                    backgroundColor:
                        isSelected
                            ? Color(0xffA772EB)
                            : Color(0xffD9D9D9).withOpacity(.25),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    shadowColor: Colors.black,
                    elevation: 4,
                    surfaceTintColor: Color(0xffD9D9D9).withOpacity(.25),
                  )
                  .onTap(() {
                    if (!isSelected) {
                      if (!moreSelectedItem) {
                        selectedList.clear();
                      }
                      selectedList.add(e);
                    } else {
                      selectedList.remove(e);
                    }
                  })
                  .paddingSymmetric(horizontal: 4, vertical: 2);
            }).toList(),
      ),
    );
  }
}
