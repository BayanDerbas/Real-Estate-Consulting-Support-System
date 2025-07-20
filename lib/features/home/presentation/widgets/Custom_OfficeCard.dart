import 'package:flutter/material.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../../../core/constants/Fonts.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';

class CustomOfficeCard extends StatelessWidget {
  final String name;
  final String bio;
  final String location;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final bool isFollowing;
  final VoidCallback onFollowToggle;
  final VoidCallback onProfileTap;

  const CustomOfficeCard({
    super.key,
    required this.name,
    required this.bio,
    required this.location,
    required this.imageUrl,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.isFollowing,
    required this.onFollowToggle,
    required this.onProfileTap,
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
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      imageUrl,
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          width: 80,
                          height: 100,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AppImages.noImage,
                          width: 80,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
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
                              style: Fonts.itim.copyWith(
                                fontSize: 18,
                                color: AppColors.black,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.brightness_1,
                              color: AppColors.skyBlue,
                              size: 10,
                            ),
                            SizedBox(width: 4),
                            Text(
                              bio,
                              style: Fonts.itim.copyWith(
                                fontSize: 14,
                                color: AppColors.grey,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.brightness_1,
                              color: AppColors.skyBlue,
                              size: 10,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'الموقع: $location',
                              style: Fonts.itim.copyWith(
                                fontSize: 14,
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 3,
              left: 0,
              child: Row(
                children: [
                  // Favorite Icon
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.deepNavy,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color:
                            isFavorite
                                ? AppColors.lavender
                                : AppColors.pureWhite,
                        size: 24,
                      ),
                      onPressed: onFavoriteToggle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Follow Icon
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.deepNavy,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        isFollowing ? Icons.person_remove : Icons.person_add,
                        color: AppColors.pureWhite,
                        size: 24,
                      ),
                      onPressed: onFollowToggle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).onTap(onProfileTap),
    );
  }
}
