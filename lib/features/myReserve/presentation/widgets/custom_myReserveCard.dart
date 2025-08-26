import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';

class MyReserveCard extends StatelessWidget {
  final String name;
  final String job;
  final String callType;
  final int duration;
  final String startTime;
  final double finalPrice;
  final String bookingStatus;
  final String imageUrl;
  final VoidCallback? onCallPressed;

  const MyReserveCard({
    super.key,
    required this.name,
    required this.job,
    required this.callType,
    required this.duration,
    required this.startTime,
    required this.finalPrice,
    required this.bookingStatus,
    required this.imageUrl,
    this.onCallPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteCard,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onCallPressed,
              child: Icon(
                callType.toLowerCase() == 'video' ? Icons.videocam : Icons.call,
                color: AppColors.lavender,
                size: 45,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(' $name',
                      style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),

                  if (job.isNotEmpty)
                    Text(' المهنة : $job',
                        style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),

                  Text('$callType : نوع المكالمة',
                      style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
                  Text('المدة : $duration دقيقة',
                      style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
                  Text('$finalPrice : السعر النهائي',
                      style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
                  Text('$startTime : التاريخ',
                      style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
                  Text('$bookingStatus : الحالة',
                      style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ClipOval(
              child: imageUrl.isNotEmpty && imageUrl.startsWith('http')
                  ? Image.network(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    AppImages.user,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    color: AppColors.deepNavy,
                  );
                },
              )
                  : Image.asset(
                AppImages.user,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                color: AppColors.deepNavy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}