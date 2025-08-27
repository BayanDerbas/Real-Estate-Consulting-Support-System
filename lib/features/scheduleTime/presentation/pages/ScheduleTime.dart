import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/core/widgets/Custom_Button.dart';
import '../../../../core/constants/Fonts.dart';
import '../controllers/ScheduleTimeController.dart';
import '../widgets/Custom_ScheduleTime.dart';

class Scheduletime extends StatelessWidget {
  const Scheduletime({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ScheduleTimeController>();
    final bool isEnglish = Get.locale?.languageCode == 'en';

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: 'Available time',
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(
                  () => CustomScheduletime(
                selectedDays: controller.selectedDays.toList(),
                onDayPressed: controller.selectDay,
                onDelete: controller.removeDay,
                timeSlots: controller.timeSlots,
                onAddSlot: controller.addSlot,
                onRemoveSlot: controller.removeSlot,
                onCallTypeChanged: controller.changeCallType,
                dayTextStyle: isEnglish
                    ? Fonts.itim.copyWith(color: AppColors.deepNavy)
                    : Fonts.taj.copyWith(color: AppColors.deepNavy),
                labelTextStyle: isEnglish
                    ? Fonts.itim.copyWith(color: AppColors.deepNavy)
                    : Fonts.taj.copyWith(color: AppColors.deepNavy),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "schedule",
              backgroundColor: AppColors.deepNavy,
              textColor: AppColors.pureWhite,
              width: double.infinity,
              onPressed: () async {
                await controller.createSchedule();
              },
            ),
          ],
        ).scrollDirection(Axis.vertical),
      ),
    );
  }
}