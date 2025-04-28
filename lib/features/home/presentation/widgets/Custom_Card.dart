import 'package:flutter/material.dart';
import '../../../../../../core/constants/colors.dart'; // مسار الألوان عندك
import '../../../../../../core/constants/fonts.dart'; // مسار الخطوط عندك

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final IconData? icon;
  final Color? IconColor;
  final VoidCallback? onTap;

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title,
    this.icon,
    this.IconColor = AppColors.pureWhite,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 320,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 240,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: AppColors.pureWhite,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: Fonts.itim.copyWith(
                            color: AppColors.deepNavy,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.deepNavy,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(icon, color: IconColor, size: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
