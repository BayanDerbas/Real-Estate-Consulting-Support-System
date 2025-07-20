import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/fonts.dart';

class Customoffices extends StatelessWidget {
  final String office;
  final bool isFavorite;
  final bool isFollowing;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onFollowToggle;
  final VoidCallback onTap;
  final VoidCallback onToggleExpand;
  final bool isExpanded;
  final String bio;
  final String location;
  final String imageUrl;

  const Customoffices({
    super.key,
    required this.office,
    required this.isFavorite,
    required this.isFollowing,
    required this.onFavoriteToggle,
    required this.onFollowToggle,
    required this.onTap,
    required this.onToggleExpand,
    required this.isExpanded,
    required this.bio,
    required this.location,
    required this.imageUrl,
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
              color: AppColors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[200],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: _isValidUrl(imageUrl)
                            ? Image.network(
                          imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return SizedBox(
                              width: 80,
                              height: 80,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              AppImages.noImage,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                            : Image.asset(
                          AppImages.noImage,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
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
                            Text(
                              office,
                              style: Fonts.itim.copyWith(
                                fontSize: 18,
                                color: AppColors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
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
                                  " الموقع :$location",
                                  style: Fonts.itim.copyWith(
                                    fontSize: 14,
                                    color: AppColors.grey,
                                  ),
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
                  top: 1,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
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
                      const SizedBox(width: 4),
                      Container(
                        decoration: const BoxDecoration(
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
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: onToggleExpand,
                child: Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColors.deepNavy,
                  size: 30,
                ),
              ),
            ),
            if (isExpanded) ...[
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Icon(
                      Icons.brightness_1,
                      color: AppColors.purple,
                      size: 10,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "الوصف : ${bio.isNotEmpty ? bio :' نبذة عن المكتب سيتم عرضها هنا'}",
                      style: Fonts.itim.copyWith(
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.deepNavy,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    "زيارة الملف",
                    style: Fonts.itim.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
bool _isValidUrl(String url) {
  return url.trim().isNotEmpty && (url.startsWith('http://') || url.startsWith('https://'));
}

