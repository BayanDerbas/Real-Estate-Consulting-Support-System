import 'package:flutter/material.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../../../core/constants/Fonts.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';

class CustomExpertCard extends StatelessWidget {
  final String name;
  final String jobTitle;
  final double rating;
  final int experienceYears;
  final double successfulCases;
  // final String appointmentDate;
  // final String appointmentTime;
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onProfileTap;
  final VoidCallback onFollowToggle;
  final bool isFollowing;
  final String role;

  const CustomExpertCard({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.rating,
    required this.experienceYears,
    required this.successfulCases,
    // required this.appointmentDate,
    // required this.appointmentTime,
    required this.imagePath,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onProfileTap,
    required this.onFollowToggle,
    required this.isFollowing,
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
                      imagePath,
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
                              value:
                                  loadingProgress.expectedTotalBytes != null
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
                SizedBox(width: 10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                name,
                                style: Fonts.itim.copyWith(
                                  fontSize: 18,
                                  color: AppColors.black,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 5,
                                ),
                                height: null,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    jobTitle,
                                    style: Fonts.itim.copyWith(
                                      fontSize: 14,
                                      color: AppColors.deepNavy,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       name,
                        //       style: Fonts.itim.copyWith(fontSize: 18, color: AppColors.black),
                        //       softWrap: true,
                        //       overflow: TextOverflow.visible,
                        //     ),
                        //     SizedBox(width: 15),
                        //     Container(
                        //       padding: EdgeInsets.symmetric(horizontal: 15),
                        //       height: 48,
                        //       decoration: BoxDecoration(
                        //         color: Colors.grey[300],
                        //         borderRadius: BorderRadius.circular(8),
                        //       ),
                        //       child: Text(
                        //         jobTitle,
                        //         style: Fonts.itim.copyWith(fontSize: 14, color: AppColors.deepNavy),
                        //         softWrap: true,
                        //         overflow: TextOverflow.visible,
                        //       ).padding(EdgeInsets.only(right: 15,left:15,top:5,bottom: 5),),
                        //     ).expanded(flex: 3),
                        //   ],
                        // ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text(
                              rating.toString(),
                              style: Fonts.itim.copyWith(
                                fontSize: 14,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                '$experienceYears سنوات من الخبرة',
                                style: Fonts.itim.copyWith(
                                  fontSize: 14,
                                  color: AppColors.grey,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.brightness_1,
                              color: AppColors.skyBlue,
                              size: 10,
                            ),
                            SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                '$successfulCases تجربة ناجحة',
                                style: Fonts.itim.copyWith(
                                  fontSize: 14,
                                  color: AppColors.black,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 8),
                        // Wrap(
                        //   crossAxisAlignment: WrapCrossAlignment.start,
                        //   children: [
                        //     Text(
                        //       'أقرب موعد يوم :  ',
                        //       style: Fonts.itim.copyWith(
                        //         fontSize: 14,
                        //         color: AppColors.grey,
                        //       ),
                        //     ),
                        //     Text(
                        //       appointmentDate,
                        //       style: Fonts.itim.copyWith(
                        //         fontSize: 14,
                        //         color: AppColors.lavender,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Wrap(
                        //   crossAxisAlignment: WrapCrossAlignment.start,
                        //   children: [
                        //     Text(
                        //       ' الساعة: ',
                        //       style: Fonts.itim.copyWith(
                        //         fontSize: 14,
                        //         color: AppColors.grey,
                        //       ),
                        //     ),
                        //     Text(
                        //       appointmentTime,
                        //       style: Fonts.itim.copyWith(
                        //         fontSize: 14,
                        //         color: AppColors.lavender,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (role == "USER" && jobTitle != "OFFICE")
              Positioned(
              bottom: 3,
              left: 0,
              child: Row(
                children: [
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
                        isFollowing ? Icons.check : Icons.person_add,
                        color: isFollowing ? AppColors.lavender : AppColors.pureWhite,
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
