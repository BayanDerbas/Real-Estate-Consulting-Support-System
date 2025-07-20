import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';

class TicketDetailsPage extends StatelessWidget {
  final String fullName;
  final String phone;
  final String location;
  final String description;
  final String priceRange;

  const TicketDetailsPage({
    super.key,
    required this.fullName,
    required this.phone,
    required this.location,
    required this.description,
    required this.priceRange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الطلب'),
        backgroundColor: AppColors.whiteCard,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDetailRow(
            icon: Icons.person_outline,
            title: 'الاسم الكامل',
            value: fullName,
          ),
          const Divider(),
          _buildDetailRow(
            icon: Icons.phone_outlined,
            title: 'رقم الهاتف',
            value: phone,
          ),
          const Divider(),
          _buildDetailRow(
            icon: Icons.location_on_outlined,
            title: 'الموقع',
            value: location,
          ),
          const Divider(),
          _buildDetailRow(
            icon: Icons.attach_money_outlined,
            title: 'الميزانية التقريبية',
            value: priceRange,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الوصف الكامل',
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
}
