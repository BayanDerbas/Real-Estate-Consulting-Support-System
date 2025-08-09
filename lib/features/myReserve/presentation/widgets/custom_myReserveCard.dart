import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';

class MyReserveCard extends StatelessWidget {
  final String name;
  final String job;
  final String callType;
  final int duration;
  final String startTime;
  final double finalPrice;
  final String bookingStatus;

  const MyReserveCard({
    super.key,
    required this.name,
    required this.job,
    required this.callType,
    required this.duration,
    required this.startTime,
    required this.finalPrice,
    required this.bookingStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteCard,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('$name : الاسم', style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
            Text('$job : المهنة', style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
            Text('$callType : نوع المكالمة ', style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
            Text('المدة : $duration دقيقة ', style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
            Text('$finalPrice : السعر النهائي ', style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
            Text('$startTime : البداية ', style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
            Text('$bookingStatus : الحالة ', style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}