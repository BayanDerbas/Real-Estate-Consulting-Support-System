import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import 'custom_ticket_widget.dart';

class MyTicketCard extends StatelessWidget {
  final String name;
  final String num;
  final String location;
  final String domain;
  final String budget;
  final double width;
  final double height;

  const MyTicketCard({
    super.key,
    required this.name,
    required this.num,
    required this.location,
    required this.domain,
    required this.budget,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TicketCard(
      width: width,
      height: height,
      backgroundColor: AppColors.whiteCard,
      widget: Center(
        child: Column(
          children: [
            ListTile(
              trailing: CircleAvatar(child: Icon(Icons.person)),

              title: Text(
                name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
                style: setTextStyle(
                  GoogleFonts.inder,
                  10,
                  AppColors.black,
                  FontWeight.bold,
                ),
              ),
              subtitle: Text(
                num,
                style: setTextStyle(
                  GoogleFonts.inder,
                  8,
                  AppColors.darkGray,
                  FontWeight.normal,
                ),
              ),
            ),
            DottedLine(
              lineLength: width,
              dashColor: AppColors.darkGray,
            ).paddingSymmetric(vertical: 10, horizontal: 0.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'المجال',
                      style: setTextStyle(
                        GoogleFonts.itim,
                        7,
                        AppColors.purple,
                        FontWeight.normal,
                      ),
                    ),
                    Text(
                      domain,
                      style: setTextStyle(
                        GoogleFonts.itim,
                        9,
                        AppColors.black,
                        FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'الميزانية',
                      style: setTextStyle(
                        GoogleFonts.itim,
                        7,
                        AppColors.purple,
                        FontWeight.normal,
                      ),
                    ),
                    Text(
                      budget,
                      style: setTextStyle(
                        GoogleFonts.itim,
                        9,
                        AppColors.black,
                        FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text('الوقت'),
                DottedLine(
                  lineLength: width,
                  dashColor: AppColors.darkGray,
                ).paddingSymmetric(vertical: 10),
                DottedLine(lineLength: width, dashColor: AppColors.darkGray),
              ],
            ),

            DottedLine(
              lineLength: width,
              dashColor: AppColors.darkGray,
            ).paddingSymmetric(vertical: 10, horizontal: 0.0),
          ],
        ).marginAll(10).paddingAll(10).scrollDirection(Axis.vertical),
      ),
    );
  }
}
