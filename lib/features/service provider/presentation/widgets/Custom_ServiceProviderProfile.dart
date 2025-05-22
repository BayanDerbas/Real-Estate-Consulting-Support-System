import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/Fonts.dart';

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
  final VoidCallback? onMessage;
  final List<String> followerImages;
  final String followers;
  final String description;
  final Widget tabBar;
  final Widget tabBarView;
  final List<String> postImages;
  final List<String> realEstateImages;
  final List<String> discountImages;

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
    required this.followerNum,
    required this.followerImages,
    required this.description,
    required this.tabBar,
    required this.tabBarView,
    required this.followers,
    required this.postImages,
    required this.realEstateImages,
    required this.discountImages,
  });

  @override
  Widget build(BuildContext context) {
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
                  CircleAvatar(backgroundImage: AssetImage(image), radius: 50),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: onFavourite,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: AppColors.purple,
                        child: Icon(
                          isFavourite ? Icons.favorite : Icons.favorite_border,
                          color: AppColors.pureWhite,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
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
                      ),
                      SizedBox(width: 20),
                      Container(
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
                        ).padding(EdgeInsets.all(8)),
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
                      SizedBox(width: 20),
                      Text(
                        "$experience سنوات من الخبرة",
                        style: Fonts.itim.copyWith(
                          color: AppColors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle, color: AppColors.babySky, size: 18),
                      SizedBox(width: 10),
                      Text(
                        "$successCount تجربة ناجحة ",
                        style: Fonts.itim.copyWith(
                          color: AppColors.black,
                          fontSize: 16,
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
            ],
          ),
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
                  isFollow ? "Follow" : "Following" ,
                  style: Fonts.itim.copyWith(color: AppColors.pureWhite),
                ),
              ),
            ],
          ).padding(EdgeInsets.all(20)),
          Divider(
            thickness: 1,
            color: AppColors.grey2,
          ).padding(EdgeInsets.symmetric(vertical: 15)),
          if (followerImages.length >= 2)
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: AssetImage(followerImages[0]),
                      ),
                      SizedBox(
                        width: 50,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(followerImages[1]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Followed by $followers",
                    style: Fonts.itim.copyWith(
                      color: AppColors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ).padding(EdgeInsets.only(left: 16)),
          Divider(
            thickness: 1,
            color: AppColors.grey2,
          ).padding(EdgeInsets.symmetric(vertical: 15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Description",
                style: Fonts.itim.copyWith(color: AppColors.grey, fontSize: 18),
              ),
              Text(
                description,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: Fonts.itim.copyWith(color: AppColors.grey, fontSize: 15),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: AppColors.grey2,
          ).padding(EdgeInsets.symmetric(vertical: 15)),
          DefaultTabController(
            length: job == "عقارات" ? 3 : 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: AppColors.deepNavy,
                  unselectedLabelColor: AppColors.grey,
                  dividerColor: AppColors.pureWhite,
                  tabs: [
                    const Tab(text: 'post'),
                    if (job == "عقارات") const Tab(text: 'real estate'),
                    const Tab(text: 'discount'),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: TabBarView(
                    children: [
                      GridView.count(
                        crossAxisCount: 3,
                        padding: const EdgeInsets.all(10),
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children:
                            postImages.map((imagePath) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }).toList(),
                      ),

                      if (job == "عقارات")
                        GridView.count(
                          crossAxisCount: 3,
                          padding: const EdgeInsets.all(10),
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          children:
                              realEstateImages.map((imagePath) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }).toList(),
                        ),

                      GridView.count(
                        crossAxisCount: 3,
                        padding: const EdgeInsets.all(10),
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children:
                            discountImages.map((imagePath) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
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
        ],
      ).padding(EdgeInsets.all(10)).scrollDirection(Axis.vertical),
    );
  }
}
