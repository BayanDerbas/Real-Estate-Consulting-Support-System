import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../controllers/myReserveController.dart';
import '../widgets/custom_myReserveCard.dart';

class MyReserve extends StatelessWidget {
  const MyReserve({super.key});

  @override
  Widget build(BuildContext context) {
    final myReserveController controller = Get.find<myReserveController>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "حجوزاتي",
          icon: Icons.notifications,
          onPressed: () {
            Get.toNamed(AppRoutes.notifications);
          },
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Column(
        children: [
          Obx(() => DropdownButton<String>(
            iconDisabledColor: AppColors.purple,
            iconEnabledColor: AppColors.purple,
            value: controller.selectedStatus.value,
            items: controller.statuses
                .map((status) => DropdownMenuItem(
              value: status,
              child: Text(status,style: Fonts.itim.copyWith(color: AppColors.purple),),
            ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                controller.changeStatus(value);
              }
            },
          )).paddingSymmetric(horizontal: 16, vertical: 8),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.reservations.isEmpty) {
                return const Center(child: Text('لا توجد حجوزات'));
              }
              return ListView.builder(
                itemCount: controller.reservations.length,
                itemBuilder: (context, index) {
                  final reservation = controller.reservations[index];
                  final dateFormat = DateFormat('yyyy-MM-dd HH:mm');

                  final name = '${reservation.expert?.user?.firstName ?? ''} ${reservation.expert?.user?.lastName ?? ''}';
                  final job = reservation.expert?.profession ?? 'غير معروف';
                  final callType = reservation.callType ?? 'غير معروف';
                  final duration = reservation.duration ?? 0;
                  final finalPrice = reservation.finalPrice ?? 0.0;
                  final startTime = reservation.startTime != null
                      ? dateFormat.format(DateTime.parse(reservation.startTime!))
                      : 'غير معروف';
                  final status = reservation.bookingStatus ?? 'غير معروف';

                  return MyReserveCard(
                    name: name,
                    job: job,
                    callType: callType,
                    duration: duration,
                    startTime: startTime,
                    finalPrice: finalPrice,
                    bookingStatus: status,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}