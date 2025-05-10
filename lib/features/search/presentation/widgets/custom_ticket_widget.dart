import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../../core/constants/styles.dart';

class TicketCard extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Widget widget;

  const TicketCard({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return TicketWidget(
      width: width,
      height: height,
      color: backgroundColor,
      isCornerRounded: true,
      child: widget,
    );
  }
}
