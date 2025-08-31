import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:intl/intl.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
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
    final myBookingsController = Get.find<MyBookingsController>();

    return DefaultTabController(
      length: controller.role.value == 'EXPERT' ? 2 : 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(175),
          child: Column(
            children: [
              Obx(() {
                String title =
                controller.role.value == 'EXPERT'
                    ? "Expert Reservations"
                    : "My Reservations";
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
                tabs:
                controller.role.value == 'EXPERT'
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
              // Status selector
              return CustomSelectStatus(
                statuses: controller.statuses,
                selectedStatus: controller.selectedStatus.value,
                onStatusSelected: (status) {
                  controller.changeStatus(status);
                  myBookingsController.changeStatus(status);
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
                children:
                controller.role.value == 'EXPERT'
                    ? [
                  _buildMyBookingsTab(myBookingsController),
                  _buildReservationsList(controller, showJob: false),
                ]
                    : [_buildMyBookingsTab(myBookingsController)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMyBookingsTab(MyBookingsController controller) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.bookings.isEmpty) {
        return const Center(child: Text("لا توجد حجوزات"));
      }
      return RefreshIndicator(
        onRefresh: () async {
          await controller.fetchBookings(controller.selectedStatus.value);
        },
        child: ListView.builder(
          itemCount: controller.bookings.length,
          itemBuilder: (context, index) {
            final booking = controller.bookings[index];
            final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
            final name =
                '${booking.expert?.user?.firstName ?? ''} ${booking.expert?.user?.lastName ?? ''}';
            final job = booking.expert?.profession ?? 'غير معروف';
            final callType = booking.callType ?? 'غير معروف';
            final duration = booking.duration ?? 0;
            final finalPrice = booking.finalPrice ?? 0.0;
            final startTime =
            booking.startTime != null
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
                log("DEBUG: calling user ${booking.expert?.user?.id}");
                ZegoUIKitPrebuiltCallInvitationService().send(
                  resourceID: 'real_cons',
                  invitees: [
                    ZegoCallUser(
                      booking.expert!.user!.id.toString(),
                      "${booking.expert?.user?.firstName} ${booking.expert?.user?.lastName}",
                    ),
                  ],
                  isVideoCall: booking.callType == "VIDEO",
                  callID: booking.id.toString(),
                );
              },
              onreport: () {
                final reportedId = booking.expert?.user?.id;
                print("DEBUG: reportedId للبلاغ = $reportedId");

                if (reportedId != null) {
                  Get.toNamed(
                    AppRoutes.report_categories,
                    arguments: {
                      "reportedId": reportedId,
                      "reportedRole": "expert",
                    },
                  );
                } else {
                  Get.snackbar(
                    "خطأ",
                    "معرف المستخدم المبلغ عنه غير متوفر",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
            );
          },
        ),
      );
    });
  }

  Widget _buildReservationsList(
      myReserveController controller, {
        bool showJob = true,
      }) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.reservations.isEmpty) {
        return const Center(child: Text('لا توجد حجوزات'));
      }
      return RefreshIndicator(
        onRefresh: () async {
          await controller.fetchReservations(controller.selectedStatus.value);
        },
        child: ListView.builder(
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
              job: showJob ? job : '',
              callType: callType,
              duration: duration,
              startTime: startTime,
              finalPrice: finalPrice,
              bookingStatus: status,
              imageUrl: imageUrl,
              onCallPressed: () {},
              onreport: () {
                final reportedId = reservation.client?.id;
                print("DEBUG: reportedId للبلاغ = $reportedId");

                if (reportedId != null) {
                  Get.toNamed(
                    AppRoutes.report_categories,
                    arguments: {
                      "reportedId": reportedId,
                      "reportedRole": "client",
                    },
                  );
                } else {
                  Get.snackbar(
                    "خطأ",
                    "معرف المستخدم المبلغ عنه غير متوفر",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
            );
          },
        ),
      );
    });
  }
}
