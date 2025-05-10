import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/styles.dart';

import '../../../../core/constants/fake_data_not_for_use.dart';
import '../../../../core/constants/image_paths.dart';
import '../controllers/appointments_controller.dart';
import '../widgets/base_search_screen.dart';
import '../widgets/custom_appointment_card.dart';
import '../widgets/custom_tab_bar.dart';

class Appointments extends StatelessWidget {
  Appointments({super.key});

  final controller = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return BaseSearchScreen(
      appBarTitle: 'Appointments',
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabSelector(
            titles: controller.titles,
            currentIndex: controller.currentIndex,
            onTabSelected: controller.changeTab,
          ).paddingSymmetric(horizontal: 10).marginSymmetric(horizontal: 10),
          Row(
                children: [
                  Icon(Icons.date_range, size: 30),
                  Text(
                    'الذهاب إلى تاريخ معين',
                    style: setTextStyle(
                      GoogleFonts.itim,
                      18,
                      AppColors.black,
                      FontWeight.normal,
                    ),
                  ),
                ],
              )
              .paddingSymmetric(horizontal: 10, vertical: 10)
              .marginSymmetric(horizontal: 10, vertical: 10),
          Text(
                'المواعيد : ',
                style: setTextStyle(
                  GoogleFonts.itim,
                  26,
                  AppColors.purple,
                  FontWeight.normal,
                ),
              )
              .paddingSymmetric(horizontal: 5, vertical: 5)
              .marginSymmetric(vertical: 5, horizontal: 10),
          const SizedBox(height: 12),
          Expanded(
            child: Obx(() => controller.screens[controller.currentIndex.value]),
          ),
        ],
      ),
    );
  }
}
