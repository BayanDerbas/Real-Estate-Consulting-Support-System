import 'package:flutter/material.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';

class CustomExpertCard extends StatelessWidget {
  final String name;
  final String jobTitle;
  final double rating;
  final int experienceYears;
  final int successfulCases;
  final String appointmentDate;
  final String appointmentTime;
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const CustomExpertCard({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.rating,
    required this.experienceYears,
    required this.successfulCases,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    imagePath,
                    width: 80,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              name,
                              style: Fonts.itim.copyWith(fontSize: 20, color: AppColors.black),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                jobTitle,
                                style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.deepNavy),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text(
                              rating.toString(),
                              style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.black),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '$experienceYears سنوات من الخبرة',
                              style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.brightness_1, color:AppColors.skyBlue, size: 10),
                            SizedBox(width: 4),
                            Text(
                              '$successfulCases تجربة ناجحة',
                              style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              'أقرب موعد يوم :  ',
                              style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.grey),
                            ),
                            Text(
                              appointmentDate,
                              style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.lavender),
                            ),
                            Text(
                              ' الساعة: ',
                              style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.black),
                            ),
                            Text(
                              appointmentTime,
                              style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.lavender),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.deepNavy,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? AppColors.lavender : AppColors.pureWhite,
                    size: 28,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
