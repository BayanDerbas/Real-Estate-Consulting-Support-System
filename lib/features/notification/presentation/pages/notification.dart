import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../controllers/notification_controller.dart';
import '../widgets/CustomNotificationCard.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NotificationController>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Notifications",
          icon: Icons.circle,
          iconColor: AppColors.deepNavy,
        ),
      ),      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }
        if (controller.notifications.isEmpty) {
          return const Center(child: Text("لا توجد إشعارات بعد"));
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.loadNotifications();
          },
          child:ListView.builder(
            itemCount: controller.notifications.length,
            itemBuilder: (context, index) {
              final notif = controller.notifications[index];
              return CustomNotificationCard(
                title: notif['tittle'] ?? "",
                message: notif['message'] ?? "",
              );
            },
          ),
        );
      }),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduation_project/core/constants/colors.dart';
// import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
// import '../controllers/notification_controller.dart';
//
// class NotificationsScreen extends StatelessWidget {
//   NotificationsScreen({super.key});
//
//   final controller = Get.find<NotificationController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(150),
//         child: CustomAppbar(
//           text: "Notifications",
//           icon: Icons.notifications,
//           iconColor: AppColors.pureWhite,
//         ),
//       ),
//       body: Obx(() {
//         if (controller.notifications.isEmpty) {
//           return const Center(child: Text("لا توجد إشعارات بعد"));
//         }
//
//         return ListView.separated(
//           itemCount: controller.notifications.length,
//           itemBuilder: (context, index) {
//             final notification = controller.notifications[index];
//             return ListTile(
//               title: Text(notification['title'] ?? ''),
//               subtitle: Text(notification['body'] ?? ''),
//               trailing: Text(
//                 formatTimestamp(notification['timestamp'] ?? ''),
//                 style: const TextStyle(fontSize: 12),
//               ),
//             );
//           },
//           separatorBuilder: (context, index) {
//             return Container(
//               height: 1,
//               color: AppColors.lightGrey,
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
//
// String formatTimestamp(String isoString) {
//   try {
//     DateTime dt = DateTime.parse(isoString);
//     final datePart = dt.toIso8601String().split('T')[0];
//     final timePart = dt.toIso8601String().split('T')[1].substring(0, 5);
//     return '$datePart $timePart';
//   } catch (e) {
//     return isoString;
//   }
// }