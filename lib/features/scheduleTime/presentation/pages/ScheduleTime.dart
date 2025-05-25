import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import '../controllers/ScheduleTimeController.dart';
import '../widgets/Custom_ScheduleTime.dart';

class Scheduletime extends StatelessWidget {
  const Scheduletime({super.key});

  @override
  Widget build(BuildContext context) {
    final ScheduleTimeController controller = Get.put(ScheduleTimeController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: 'Availble time',
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            children: [
              CustomScheduletime(
                selectedDays: controller.selectedDays.value,
                onDayPressed: controller.selectDay,
                onDelete: controller.removeDay,
              ),
              CustomButton(
                text: "schedule",
                backgroundColor: AppColors.deepNavy,
                textColor: AppColors.pureWhite,
                width: double.infinity,
              ),
            ],
          ),
        ).scrollDirection(Axis.vertical),
      ),
    );
  }
}
