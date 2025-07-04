import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import 'custom_ticket_widget.dart';

class MyTicketCard extends StatelessWidget {
  final String fullName;
  final String phone;
  final String location;
  final String description;
  final String priceRange;
  final double width;
  final double height;

  const MyTicketCard({
    super.key,
    required this.fullName,
    required this.phone,
    required this.location,
    required this.description,
    required this.priceRange,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TicketCard(
      width: width,
      height: height,
      backgroundColor: AppColors.whiteCard,
      widget: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Name and Phone
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(
                fullName,
                style: setTextStyle(
                  GoogleFonts.inder,
                  13,
                  AppColors.black,
                  FontWeight.bold,
                ),
              ),
              subtitle: Text(
                phone,
                style: setTextStyle(
                  GoogleFonts.inder,
                  10,
                  AppColors.darkGray,
                  FontWeight.normal,
                ),
              ),
            ),

            const SizedBox(height: 10),
            const DottedLine(dashColor: AppColors.darkGray),
            const SizedBox(height: 12),

            // Description and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabelValue(label: 'الوصف', value: description),
                _buildLabelValue(
                  label: 'الميزانية',
                  value: priceRange,
                  alignRight: true,
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Location
            Row(
              children: [
                Icon(Icons.location_on, color: AppColors.darkGray, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    location,
                    style: setTextStyle(
                      GoogleFonts.inder,
                      11,
                      AppColors.black,
                      FontWeight.normal,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            const DottedLine(dashColor: AppColors.darkGray),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelValue({
    required String label,
    required String value,
    bool alignRight = false,
  }) {
    return Column(
      crossAxisAlignment:
          alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: setTextStyle(
            GoogleFonts.itim,
            10,
            AppColors.purple,
            FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: setTextStyle(
            GoogleFonts.itim,
            11,
            AppColors.black,
            FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
