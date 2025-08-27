import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/features/chats/presentation/controllers/chat_controller.dart';
import 'package:graduation_project/features/chats/presentation/controllers/room_controller.dart';
import 'package:graduation_project/features/officers/data/model/userOffice.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';

class TicketDetailsPage extends StatelessWidget {
  final String fullName;
  final String location;
  final String description;
  final String priceRange;
  UserOffice? user;

  TicketDetailsPage({
    super.key,
    required this.fullName,
    required this.location,
    required this.description,
    required this.priceRange,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ticket_details'.tr,
          style: TextStyle(color: AppColors.pureWhite),
        ),
        backgroundColor: AppColors.deepNavy,
        actions: [
          IconButton(
            icon: Icon(Icons.chat, color: AppColors.pureWhite),
            onPressed: () {
              Get.find<RoomController>().findOrCreateRoom(user!);
              Get.toNamed(AppRoutes.chatPage);
            },
          ).paddingDirectional(const EdgeInsetsDirectional.all(20)),
        ],
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
          color: AppColors.pureWhite,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDetailRow(
            icon: Icons.person_outline,
            title: 'full_name'.tr,
            value: fullName,
          ),
          const Divider(),
          _buildDetailRow(
            icon: Icons.location_on_outlined,
            title: 'location'.tr,
            value: location,
          ),
          const Divider(),
          _buildDetailRow(
            icon: Icons.attach_money_outlined,
            title: 'approx_budget'.tr,
            value: priceRange,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'full_description'.tr,
                  style: setTextStyle(
                    GoogleFonts.cairo,
                    16,
                    AppColors.purple,
                    FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: setTextStyle(
                    GoogleFonts.cairo,
                    14,
                    AppColors.black,
                    FontWeight.normal,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          /// Buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Navigate to update page
                  Get.snackbar("Update", "Update button clicked for $fullName");
                },
                icon: const Icon(
                  Icons.edit,
                  size: 18,
                  color: AppColors.pureWhite,
                ),
                label: Text(
                  "Update",
                  style: setTextStyle(
                    GoogleFonts.cairo,
                    14,
                    AppColors.pureWhite,
                    FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.deepNavy,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Confirm delete
                  _showDeleteDialog(context);
                },
                icon: const Icon(
                  Icons.delete,
                  size: 18,
                  color: AppColors.pureWhite,
                ),
                label: Text(
                  "Delete",
                  style: setTextStyle(
                    GoogleFonts.cairo,
                    14,
                    AppColors.pureWhite,
                    FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.deepNavy,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.purple, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: setTextStyle(
                    GoogleFonts.cairo,
                    12,
                    AppColors.darkGray,
                    FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: setTextStyle(
                    GoogleFonts.cairo,
                    15,
                    AppColors.black,
                    FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    Get.defaultDialog(
      title: "Confirm Delete",
      middleText: "Are you sure you want to delete this ticket?",
      textCancel: "Cancel",
      textConfirm: "Delete",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        // TODO: perform delete logic
        Get.back();
        Get.snackbar("Deleted", "Ticket has been deleted");
      },
    );
  }
}
