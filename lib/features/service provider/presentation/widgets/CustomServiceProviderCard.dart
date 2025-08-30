import 'package:flutter/material.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';

class Customserviceprovidercard extends StatelessWidget {
  final int index;
  final Map<String, dynamic> provider;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onToggleExpand;
  final VoidCallback? onTap;
  final VoidCallback? onCardTap;
  final String? price;
  final String textProvider;
  final bool isFavorite;
  final bool isFollowing;
  final bool isExpanded;
  final String imageUrl;
  final VoidCallback onFollowToggle;
  final String role;

  const Customserviceprovidercard({
    super.key,
    required this.index,
    required this.provider,
    required this.onFavoriteToggle,
    required this.onToggleExpand,
    required this.onTap,
    required this.price,
    required this.textProvider,
    required this.onCardTap,
    required this.isFavorite,
    required this.isFollowing,
    required this.onFollowToggle,
    required this.isExpanded,
    required this.imageUrl,
    required this.role,
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
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: provider['idCardImage'] != null &&
                            provider['idCardImage'].toString().startsWith("http")
                            ? Image.network(
                          provider['idCardImage'],
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
                        )
                            : Image.asset(
                          AppImages.noImage,
                          width: 80,
                          height: 100,
                          fit: BoxFit.cover,
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
                                    provider['name'],
                                    style: Fonts.itim.copyWith(
                                      fontSize: 18,
                                      color: AppColors.black,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Container(
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey2,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text(
                                        provider['jobTitle'],
                                        style: Fonts.itim.copyWith(
                                          fontSize: 14,
                                          color: AppColors.darkGray,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ).padding(EdgeInsets.all(5)),
                                    ),
                                  ).expanded(flex: 3),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    provider['rating'].toString(),
                                    style: Fonts.itim.copyWith(fontSize: 14,color: AppColors.grey),
                                  ),
                                  const SizedBox(width: 8),
                                  Flexible(
                                    child: Text(
                                      '${provider['experienceYears']} سنوات من الخبرة',
                                      style: Fonts.itim.copyWith(
                                        fontSize: 14,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.brightness_1,
                                    color: AppColors.skyBlue,
                                    size: 10,
                                  ),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      '${provider['rateCount']} تجربة ناجحة',
                                      style: Fonts.itim.copyWith(fontSize: 14,color: AppColors.grey),
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
                  if (role == "USER")
                    Positioned(
                    bottom: 5,
                    left: 0,
                    child:
                    Row(
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
                        SizedBox(width: 3,),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.deepNavy,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                isFollowing ? Icons.check : Icons.person_add,
                                color:isFollowing ? AppColors.lavender :AppColors.pureWhite,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    textProvider,
                    style: Fonts.itim.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.timelapse, color: AppColors.deepNavy),
                      SizedBox(width: 5),
                      Text(
                        "سعر الدقيقة : ",
                        style: Fonts.itim.copyWith(
                          fontSize: 14,
                          color: AppColors.grey,
                        ),
                      ),
                      Text(
                        price ?? "غير محدد",
                        style: Fonts.itim.copyWith(
                          fontSize: 14,
                          color: AppColors.lavender,
                        ),
                      ),
                    ],
                  ),
                ],
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
                    "حجز",
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
    ).onTap(onCardTap!);
  }
}
