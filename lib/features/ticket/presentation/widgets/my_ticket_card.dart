import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:graduation_project/features/ticket/presentation/widgets/ticket_details_page.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import 'custom_ticket_widget.dart';

class MyTicketCard extends StatelessWidget {
  final String fullName, location, description, priceRange;
  final double width, height;

  const MyTicketCard({
    super.key,
    required this.fullName,

    required this.location,
    required this.description,
    required this.priceRange,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final cuttedDesc =
        description.length > 15
            ? description.substring(0, 15) + '........'
            : description;
    return InkWell(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => TicketDetailsPage(
                    fullName: fullName,
                    location: location,
                    description: description,
                    priceRange: priceRange,
                  ),
            ),
          ),
      child: TicketCard(
        width: width,
        height: height,
        backgroundColor: AppColors.whiteCard,
        widget: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(
                  fullName,
                  style: setTextStyle(
                    GoogleFonts.inder,
                    17,
                    AppColors.black,
                    FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  location,
                  style: setTextStyle(
                    GoogleFonts.inder,
                    13,
                    AppColors.darkGray,
                    FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const DottedLine(dashColor: AppColors.darkGray, lineThickness: 3),
              const SizedBox(height: 12),
              _labelValue('Description', cuttedDesc),
              const SizedBox(height: 8),
              _labelValue('Price', priceRange),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColors.darkGray,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      location,
                      style: setTextStyle(
                        GoogleFonts.inder,
                        15,
                        AppColors.black,
                        FontWeight.normal,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const DottedLine(dashColor: AppColors.darkGray, lineThickness: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _labelValue(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: setTextStyle(
            GoogleFonts.itim,
            15,
            AppColors.purple,
            FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: setTextStyle(
            GoogleFonts.itim,
            15,
            AppColors.black,
            FontWeight.normal,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
