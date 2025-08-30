import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/Custom_Appbar.dart';
import '../controllers/available_times_controller.dart';
import '../widgets/custom_available_working_times.dart';

class MyAvailableTimes extends StatelessWidget {
  const MyAvailableTimes({super.key});

  @override
  Widget build(BuildContext context) {
    final AvailableTimesController controller = Get.find();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Service Provider Profile",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
          onPressed: () {
            Get.toNamed(AppRoutes.notifications);
          },
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.availableTimes.isEmpty) {
          return const Center(child: Text("No available times"));
        }

        return ListView.builder(
          itemCount: controller.availableTimes.length,
          itemBuilder: (context, index) {
            final time = controller.availableTimes[index];
            return CustomAvailableTimes(
              day: time.dayOfWeek.toString(),
              startTime: time.startTime!.substring(0, 5),
              endTime: time.endTime!.substring(0, 5),
              callType: time.callType ?? 'N/A',
            );
          },
        );
      }),
    );
  }
}
