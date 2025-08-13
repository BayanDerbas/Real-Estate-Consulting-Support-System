import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import '../controllers/notification_controller.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final controller = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Notifications",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Obx(() {
        if (controller.notifications.isEmpty) {
          return const Center(child: Text("لا توجد إشعارات بعد"));
        }

        return ListView.separated(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final notification = controller.notifications[index];
            return ListTile(
              title: Text(notification['title'] ?? ''),
              subtitle: Text(notification['body'] ?? ''),
              trailing: Text(
                formatTimestamp(notification['timestamp'] ?? ''),
                style: const TextStyle(fontSize: 12),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 1,
              color: AppColors.lightGrey,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            );
          },
        );
      }),
    );
  }
}

String formatTimestamp(String isoString) {
  try {
    DateTime dt = DateTime.parse(isoString);
    final datePart = dt.toIso8601String().split('T')[0];
    final timePart = dt.toIso8601String().split('T')[1].substring(0, 5);
    return '$datePart $timePart';
  } catch (e) {
    return isoString;
  }
}