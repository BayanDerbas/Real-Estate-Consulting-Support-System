import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../controllers/myBookingsController.dart';
import '../controllers/myReserveController.dart';
import '../widgets/custom_myReserveCard.dart';
import '../widgets/custom_select_status.dart';

class MyReserve extends StatelessWidget {
  const MyReserve({super.key});

  @override
  Widget build(BuildContext context) {
    final myReserveController controller = Get.find<myReserveController>();

    return DefaultTabController(
      length: controller.role.value == 'EXPERT' ? 2 : 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(175),
          child: Column(
            children: [
              Obx(() {
                String title;
                if (controller.role.value == 'EXPERT') {
                  title = "Expert Reservations";
                } else {
                  title = "My Reservations";
                }
                return CustomAppbar(
                  text: title,
                  icon: Icons.notifications,
                  onPressed: () {
                    Get.toNamed(AppRoutes.notifications);
                  },
                  iconColor: AppColors.pureWhite,
                );
              }),
              TabBar(
                indicatorColor: AppColors.purple,
                labelColor: AppColors.purple,
                unselectedLabelColor: Colors.grey,
                tabs: controller.role.value == 'EXPERT'
                    ? [
                  Tab(
                    child: Text(
                      "📅 My Bookings",
                      style: Fonts.itim.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepNavy,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "👥 Clients Bookings",
                      style: Fonts.itim.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepNavy,
                      ),
                    ),
                  ),
                ]
                    : [
                  Tab(
                    child: Text(
                      "📅 My Bookings",
                      style: Fonts.itim.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.deepNavy,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Obx(() {
              return CustomSelectStatus(
                statuses: controller.statuses,
                selectedStatus: controller.selectedStatus.value,
                onStatusSelected: (status) {
                  controller.changeStatus(status);
                },
              );
            }),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "المواعيد",
                style: Fonts.taj.copyWith(
                  color: AppColors.lavender,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ).padding(const EdgeInsets.only(right: 15)),
            const SizedBox(height: 15),
            Expanded(
              child: TabBarView(
                children: controller.role.value == 'EXPERT'
                    ? [
                  _buildMyBookingsTab(),
                  _buildReservationsList(controller, "EXPERT"),
                ]
                    : [
                  _buildMyBookingsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMyBookingsTab() {
    final myBookingsController = Get.find<MyBookingsController>();
    return Obx(() {
      if (myBookingsController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (myBookingsController.bookings.isEmpty) {
        return const Center(child: Text("لا توجد حجوزات"));
      }
      return ListView.builder(
        itemCount: myBookingsController.bookings.length,
        itemBuilder: (context, index) {
          final booking = myBookingsController.bookings[index];
          final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
          final name = '${booking.expert?.user?.firstName ?? ''} ${booking.expert?.user?.lastName ?? ''}';
          final job = booking.expert?.profession ?? 'غير معروف';

          final callType = booking.callType ?? 'غير معروف';
          final duration = booking.duration ?? 0;
          final finalPrice = booking.finalPrice ?? 0.0;
          final startTime = booking.startTime != null
              ? dateFormat.format(DateTime.parse(booking.startTime!))
              : 'غير معروف';
          final status = booking.bookingStatus ?? 'غير معروف';
          final imageUrl = booking.expert?.user?.id != null ? "" : "";

          return MyReserveCard(
            name: name,
            job: job,
            callType: callType,
            duration: duration,
            startTime: startTime,
            finalPrice: finalPrice,
            bookingStatus: status,
            imageUrl: imageUrl,
            onCallPressed: () {
              if (callType.toLowerCase() == 'video') {
                // TODO: go to video call
              } else {
                // TODO: go to audio call
              }
            },
          );
        },
      );
    });
  }

  Widget _buildReservationsList(myReserveController controller, String type) {
    return Obx(() {
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
          final name =
              '${reservation.client?.firstName ?? ''} ${reservation.client?.lastName ?? ''}';
          final job = reservation.expert?.profession ?? 'غير معروف';

          final callType = reservation.callType ?? 'غير معروف';
          final duration = reservation.duration ?? 0;
          final finalPrice = reservation.finalPrice ?? 0.0;
          final startTime =
          reservation.startTime != null
              ? dateFormat.format(DateTime.parse(reservation.startTime!))
              : 'غير معروف';
          final status = reservation.bookingStatus ?? 'غير معروف';
          final imageUrl = reservation.expert?.idCardImage ?? "";

          return MyReserveCard(
            name: name,
            job: job,
            callType: callType,
            duration: duration,
            startTime: startTime,
            finalPrice: finalPrice,
            bookingStatus: status,
            imageUrl: imageUrl,
            onCallPressed: () {
              if (callType.toLowerCase() == 'video') {
              } else {

              }
            },
          );
        },
      );
    });
  }
}