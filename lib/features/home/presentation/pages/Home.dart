import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/widgets/Custom_Post.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../../../../core/widgets/Custom_BottomBar.dart';
import '../../../../core/widgets/Custom_ExpertCard.dart';
import '../../../../core/widgets/Custom_IconButton.dart';
import '../../../../core/widgets/Custom_Card.dart';
import '../../../../core/widgets/Custom_QuickAccess.dart';
import '../controllers/Home_Controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150), // Height of the AppBar
        child: CustomAppbar(
          text: "Welcome Home",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
                  () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomIconButton(
                      icon: Icons.wallet_outlined,
                      label: 'Wallet',
                      isSelected: controller.selectedIndex.value == 0,
                      onTap: () => controller.selectIndex(0),
                    ),
                    CustomIconButton(
                      icon: Icons.favorite_border,
                      label: 'Favorite',
                      isSelected: controller.selectedIndex.value == 1,
                      onTap: () => controller.selectIndex(1),
                    ),
                    CustomIconButton(
                      icon: Icons.group_add,
                      label: 'Followings',
                      isSelected: controller.selectedIndex.value == 2,
                      onTap: () => controller.selectIndex(2),
                    ),
                    CustomIconButton(
                      icon: Icons.home_work_rounded,
                      label: 'Properties',
                      isSelected: controller.selectedIndex.value == 3,
                      onTap: () => controller.selectIndex(3),
                    ),
                    CustomIconButton(
                      icon: Icons.engineering,
                      label: 'Services Provider',
                      isSelected: controller.selectedIndex.value == 4,
                      onTap: () => controller.selectIndex(4),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.propertiesList.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> property =
                  controller.propertiesList[index];
                  return CustomCard(
                    onTap: () {
                      print("..........................");
                    },
                    imagePath: property['imagePath'],
                    title: property['title'],
                    icon: Icons.north_east,
                  );
                },
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Quick Access",
                style: Fonts.itim.copyWith(
                  color: AppColors.deepNavy,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CustomQuickAccessCard(
                    title: "Send Request",
                    imagePath: 'assets/images/sendRequest.png',
                    backgroundColor: AppColors.blushRose,
                    onPressed: () {
                      print(
                        'Send Request Pressed.........................................',
                      );
                    },
                  ),
                  CustomQuickAccessCard(
                    title: "Publish Ticket",
                    imagePath: 'assets/images/PublishTicket.png',
                    backgroundColor: AppColors.skyBlue,
                    onPressed: () {
                      print('Publish Ticket Pressed');
                    },
                  ),
                  CustomQuickAccessCard(
                    title: "My Appointments",
                    imagePath: 'assets/images/MyAppointement.png',
                    backgroundColor: AppColors.goldenYellow,
                    onPressed: () {
                      print('My Appointments Pressed');
                    },
                  ),
                  CustomQuickAccessCard(
                    title: "Search Experts",
                    imagePath: 'assets/images/SearchExperts.png',
                    backgroundColor: AppColors.lavender,
                    onPressed: () {
                      print('Search Experts Pressed');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Experts",
                    style: Fonts.itim.copyWith(
                      color: AppColors.black,
                      fontSize: 24,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print("...............................");
                    },
                    child: Text(
                      "See all",
                      style: Fonts.itim.copyWith(
                        color: AppColors.lavender,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
                  () => CustomExpertCard(
                name: 'محمد محمد',
                jobTitle: 'محامي',
                rating: 4.9,
                experienceYears: 7,
                successfulCases: 20,
                appointmentDate: '10-25',
                appointmentTime: '5:00 م',
                imagePath: 'assets/images/expert.jpg',
                isFavorite: controller.isFavorite.value, // نمرر الحالة
                onFavoriteToggle: () {
                  controller.isFavorite
                      .toggle(); // نقلب القيمة لما يضغط على القلب
                },
              ),
            ),
            CustomPost(
              username: 'محمد محمد',
              userImage: 'assets/images/expert.jpg',
              postText: '...............................................\n.....................................................',
              postImage: 'assets/images/garden.jpg',
              isFollowing: controller.isFollowing,
              isLiked: controller.isLiked,
              isDisLiked: controller.isDisLiked,
              onFollow: controller.toggleFollow,
              onLike: controller.toggleLike,
              onDisLike: controller.toggleUnLike,
            ),

          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}