import 'package:flutter/material.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';

import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';

class Customserviceprovidercard extends StatelessWidget {
  final int index;
  final Map < String , dynamic > provider;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onToggleExpand;
  final VoidCallback? onTap;
  final VoidCallback? onCardTap;
  final String pricre;
  final String textProvider;

  const Customserviceprovidercard({
    super.key,
    required this.index,
    required this.provider,
    required this.onFavoriteToggle,
    required this.onToggleExpand,
    required this.onTap,
    required this.pricre,
    required this.textProvider,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isExpanded = provider['isExpanded'] ?? false;
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
            Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        provider['imagePath'],
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
                                  style: Fonts.itim.copyWith(fontSize: 18, color: AppColors.black),
                                ),
                                const SizedBox(width: 15),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.grey2,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      provider['jobTitle'],
                                      style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.darkGray),
                                    ).padding(EdgeInsets.all(5)),
                                  ),
                                ).expanded(flex: 3),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 18),
                                const SizedBox(width: 4),
                                Text(
                                  provider['rating'].toString(),
                                  style: Fonts.itim.copyWith(fontSize: 14),
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    '${provider['experienceYears']} سنوات من الخبرة',
                                    style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.grey),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.brightness_1, color: AppColors.skyBlue, size: 10),
                                const SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    '${provider['successfulCases']} تجربة ناجحة',
                                    style: Fonts.itim.copyWith(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              children: [
                                Text("أقرب موعد يوم: ", style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.grey)),
                                Text(provider['appointmentDate'], style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.lavender)),
                              ],
                            ),
                            Wrap(
                              children: [
                                Text(" الساعة: ", style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.grey)),
                                Text(provider['appointmentTime'], style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.lavender)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 3,
                  left: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.deepNavy,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        provider['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                        color: provider['isFavorite'] ? AppColors.lavender : AppColors.pureWhite,
                        size: 28,
                      ),
                      onPressed: onFavoriteToggle,
                    ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    textProvider,
                    style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.black),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "سعر الدقيقة : ",
                        style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.grey),
                      ),
                      Text(
                        "${provider['price']}",
                        style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.lavender),
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
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: Text(
                    "حجز",
                    style: Fonts.itim.copyWith(fontSize: 16, color: Colors.white),
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
