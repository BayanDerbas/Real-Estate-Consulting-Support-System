import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';

class CustomNotificationCard extends StatelessWidget {
  final String title;
  final String message;

  const CustomNotificationCard({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.notifications,color: AppColors.purple,),
                  SizedBox(width: 3,),
                  Text(
                    title,
                    style: Fonts.itim.copyWith(
                      color: AppColors.purple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: Fonts.itim.copyWith(
                  color: AppColors.darkGray,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
