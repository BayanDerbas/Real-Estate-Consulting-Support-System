import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/utils/secure_storage.dart';
import '../../../home/presentation/widgets/Custom_Post.dart';
import '../../../properties/presentation/widgets/Custom_Properties.dart';

class CustomServiceproviderprofile extends StatelessWidget {
  final String image;
  final String name;
  final String job;
  final String rating;
  final String experience;
  final String successCount;
  final String followerNum;
  final VoidCallback? onFavourite;
  final bool isFavourite;
  final bool isFollow;
  final VoidCallback? onFollow;
  final VoidCallback? onBook;
  final VoidCallback? onCall;
  final VoidCallback? onMessage;
  final VoidCallback? onTap;
  final List<String> followerImages;
  final String followers;
  final String description;
  final List<String> postImages;
  final List<String> realEstateImages;
  final List<Map<String, dynamic>> discounts;
  final List<Map<String, dynamic>> posts;
  final List<Map<String, dynamic>> properties;
  final String role;
  final String profileRole;
  final ValueChanged<double> onRatingChanged;
  final double rate;

  const CustomServiceproviderprofile({
    super.key,
    required this.image,
    required this.name,
    required this.job,
    required this.rating,
    required this.experience,
    required this.successCount,
    this.onFavourite,
    this.isFavourite = false,
    this.isFollow = false,
    required this.onFollow,
    required this.onBook,
    required this.onMessage,
    this.onTap,
    required this.followerNum,
    required this.followerImages,
    required this.description,
    required this.followers,
    required this.postImages,
    required this.realEstateImages,
    required this.discounts,
    this.onCall,
    required this.posts,
    required this.properties,
    required this.role,
    required this.profileRole,
    required this.onRatingChanged,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    int tabLength = 1;
    if (job != "OFFICE") tabLength += 1;
    if (job == "OFFICE") tabLength += 1;
    final currentId = SecureStorage().getIdByRole();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        image,
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
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
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
                  if (role == "USER" && profileRole != "OFFICE")
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: onFavourite,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.purple,
                          child: Icon(
                            isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: AppColors.pureWhite,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: Fonts.itim.copyWith(
                            color: AppColors.black,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 20),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.grey2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              job,
                              style: Fonts.itim.copyWith(
                                color: AppColors.grey,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ).padding(EdgeInsets.all(8)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                          size: 25,
                        ),
                        SizedBox(width: 5),
                        Text(
                          rating,
                          style: Fonts.itim.copyWith(
                            color: AppColors.black,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 10), // Reduce spacing
                        Flexible(
                          child: Text(
                            "$experience سنوات من الخبرة",
                            style: Fonts.itim.copyWith(
                              color: AppColors.grey,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.circle, color: AppColors.babySky, size: 18),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "$successCount تجربة ناجحة ",
                            style: Fonts.itim.copyWith(
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          followerNum,
                          style: Fonts.itim.copyWith(
                            color: AppColors.purple,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "متابع",
                          style: Fonts.itim.copyWith(
                            color: AppColors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          //..............................
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  backgroundColor: AppColors.grey2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: onMessage,
                child: Icon(Icons.mail, color: AppColors.deepNavy, size: 30),
              ),
              SizedBox(width: 8),

              if (onBook != null)
                ElevatedButton(
                  onPressed: onBook,
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    backgroundColor: AppColors.grey2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(AppImages.book, scale: 8),
                      SizedBox(width: 5),
                      Text(
                        "Book",
                        style: Fonts.itim.copyWith(color: AppColors.deepNavy),
                      ),
                    ],
                  ),
                ),

              SizedBox(width: 8),

              ElevatedButton(
                onPressed: onCall,
                style: ElevatedButton.styleFrom(
                  elevation: 5.0,
                  backgroundColor: AppColors.grey2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset(AppImages.callIcon, scale: 11),
                    SizedBox(width: 5),
                    Text(
                      "Call",
                      style: Fonts.itim.copyWith(color: AppColors.deepNavy),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              if (role == "USER" && profileRole != "OFFICE")
                ElevatedButton(
                  onPressed: onFollow,
                  style: ElevatedButton.styleFrom(
                    elevation: 5.0,
                    backgroundColor: AppColors.deepNavy,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    isFollow ? "Following" : "Follow",
                    style: Fonts.itim.copyWith(color: AppColors.pureWhite),
                  ),
                ),
            ],
          ).padding(EdgeInsets.all(20)).scrollDirection(Axis.horizontal),
          if (role == "USER")
            Divider(
              thickness: 1,
              color: AppColors.grey2,
            ).padding(EdgeInsets.symmetric(vertical: 15)),
          // if (role == "USER" && profileRole != "OFFICE")
          //   if (followerImages.length >= 2)
          Directionality(
            textDirection: TextDirection.ltr,
            child: RatingBar.builder(
              initialRating: rate,
              minRating: 1,
              maxRating: 5,
              itemSize: 50,
              glow: false,
              allowHalfRating: false,
              itemBuilder:
                  (context, _) => Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber.withOpacity(0.7),
                  ),
              unratedColor: AppColors.grey2,
              onRatingUpdate: onRatingChanged,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Stack(
            //       children: [
            //         CircleAvatar(
            //           radius: 12,
            //           backgroundImage: AssetImage(followerImages[0]),
            //         ),
            //         SizedBox(
            //           width: 50,
            //           child: CircleAvatar(
            //             radius: 12,
            //             backgroundImage: AssetImage(followerImages[1]),
            //           ),
            //         ),
            //       ],
            //     ),
            //     SizedBox(width: 5),
            //     Text(
            //       "Followed by $followers",
            //       style: Fonts.itim.copyWith(
            //         color: AppColors.grey,
            //         fontSize: 16,
            //       ),
            //     ),
            //   ],
            // ),
          ).padding(EdgeInsets.only(left: 16)),
          Divider(
            thickness: 1,
            color: AppColors.grey2,
          ).padding(EdgeInsets.symmetric(vertical: 15)),
          Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Description",
                  style: Fonts.itim.copyWith(
                    color: AppColors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  description,
                  textAlign: TextAlign.left,
                  style: Fonts.itim.copyWith(
                    color: AppColors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ).padding(EdgeInsets.only(left: 10)),
          Divider(
            thickness: 1,
            color: AppColors.grey2,
          ).padding(EdgeInsets.symmetric(vertical: 15)),
          DefaultTabController(
            length: job != "OFFICE" ? 2 : 1,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                children: [
                  TabBar(
                    labelColor: AppColors.deepNavy,
                    unselectedLabelColor: AppColors.grey,
                    dividerColor: AppColors.pureWhite,
                    tabs: [
                      if (job != "OFFICE") const Tab(text: 'posts'),
                      if (job != "OFFICE") const Tab(text: 'discounts'),
                      if (job == "OFFICE") const Tab(text: 'real estates'),
                    ],
                  ),
                  SizedBox(
                    height: 250,
                    child: TabBarView(
                      children: [
                        if (job != "OFFICE")
                          GridView.count(
                            crossAxisCount: 3,
                            padding: const EdgeInsets.all(10),
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            children:
                                posts.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final post = entry.value;
                                  return GestureDetector(
                                    onTap: () {
                                      if (post['onTap'] != null)
                                        post['onTap']();
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        post['postImage'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                        if (job != "OFFICE")
                          GridView.count(
                            crossAxisCount: 3,
                            childAspectRatio: 0.7,
                            padding: const EdgeInsets.all(5),
                            children:
                                discounts.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final discount = entry.value;
                                  final colors = [
                                    AppColors.lavender,
                                    AppColors.softPink,
                                    AppColors.babySky,
                                    AppColors.aquaBlue,
                                    AppColors.goldenYellow,
                                    AppColors.purple,
                                  ];
                                  return GestureDetector(
                                    onTap: () {
                                      print(
                                        "تم الضغط على الخصم: ${discount['code']}",
                                      );
                                    },
                                    child: DiscountItem(
                                      discount: discount['discount']!,
                                      description: discount['description']!,
                                      code: discount['code']!,
                                      color: colors[index % colors.length],
                                    ),
                                  );
                                }).toList(),
                          ),
                        if (job == "OFFICE")
                          GridView.count(
                            crossAxisCount: 3,
                            padding: const EdgeInsets.all(10),
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            children:
                                properties.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final property = entry.value;
                                  return GestureDetector(
                                    onTap: () {
                                      if (property['onTap'] != null)
                                        property['onTap']();
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        property['imagePath'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ).padding(EdgeInsets.all(10)).scrollDirection(Axis.vertical),
    );
  }
}

class DiscountItem extends StatelessWidget {
  final String discount;
  final String description;
  final String code;
  final Color color;

  const DiscountItem({
    super.key,
    required this.discount,
    required this.description,
    this.code = '',
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.card_giftcard, color: AppColors.deepNavy, size: 30),
              const SizedBox(width: 6),
              Text(
                discount,
                style: Fonts.itim.copyWith(
                  color: AppColors.deepNavy,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 11),
          ),
          if (code.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              "الكود: $code",
              style: Fonts.itim.copyWith(
                color: AppColors.deepNavy,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
