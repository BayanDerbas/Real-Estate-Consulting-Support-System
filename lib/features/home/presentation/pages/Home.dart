import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Drawer.dart';
import 'package:graduation_project/features/home/presentation/widgets/Custom_Post.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../widgets/Custom_BottomBar.dart';
import '../widgets/Custom_ExpertCard.dart';
import '../../../../core/widgets/Custom_IconButton.dart';
import '../widgets/Custom_Card.dart';
import '../widgets/Custom_QuickAccess.dart';
import '../controllers/Home_Controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final CustomDrawerController drawerController = Get.put(CustomDrawerController());
    return Scaffold(
      drawer:CustomDrawer(
        userName: drawerController.userName.value,
        email: drawerController.email.value,
        userImage: drawerController.userImage.value,
      ),
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: CustomAppbar(
          text: "Welcome Home",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
                () =>
                Row(
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
                      onTap: () {
                        controller.selectIndex(3);
                        Get.toNamed("/properties");
                        },
                    ),
                    CustomIconButton(
                      icon: Icons.engineering,
                      label: 'Services Provider',
                      isSelected: controller.selectedIndex.value == 4,
                      onTap: () => controller.selectIndex(4),
                    ),
                  ],
                ).scrollDirection(Axis.horizontal),
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
          Text(
            "Quick Access",
            style: Fonts.itim.copyWith(
              color: AppColors.deepNavy,
              fontSize: 24,
            ),
          ).padding(EdgeInsets.all(8)),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              CustomQuickAccessCard(
                title: "Send Request",
                imagePath: AppImages.sendRequest,
                backgroundColor: AppColors.blushRose,
                onPressed: () {
                  print(
                    'Send Request Pressed.........................................',
                  );
                },
              ).makeSafeArea(),
              CustomQuickAccessCard(
                title: "Publish Ticket",
                imagePath: AppImages.PublishTicket,
                backgroundColor: AppColors.skyBlue,
                onPressed: () {
                  print('Publish Ticket Pressed');
                },
              ),
              CustomQuickAccessCard(
                title: "My Appointments",
                imagePath: AppImages.MyAppointement,
                backgroundColor: AppColors.goldenYellow,
                onPressed: () {
                  print('My Appointments Pressed');
                },
              ),
              CustomQuickAccessCard(
                title: "Search Experts",
                imagePath: AppImages.SearchExperts,
                backgroundColor: AppColors.lavender,
                onPressed: () {
                  print('Search Experts Pressed');
                },
              ),
            ],
          ),
          Row(
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
          ).padding(EdgeInsets.all(8)),
          Obx(
                () =>
                CustomExpertCard(
                  name: 'محمد محمد',
                  jobTitle: 'محامي',
                  rating: 4.9,
                  experienceYears: 7,
                  successfulCases: 20,
                  appointmentDate: '10-25',
                  appointmentTime: '5:00 م',
                  imagePath: AppImages.expert,
                  isFavorite: controller.isFavorite.value,
                  onFavoriteToggle: () {
                    controller.isFavorite
                        .toggle();
                  },
                ),
          ),
          Column(
            children: List.generate(controller.postsList.length, (index) {
              final post = controller.postsList[index];
              return CustomPost(
                username: post['userName'] as String,
                userImage: post['userImage'] as String,
                postText: post['postText'] as String,
                postImage: post['postImage'] as String,
                isFollowing: controller.isFollowing,
                isLiked: post['isLiked'] as RxBool,
                isDisLiked: post['isDisLiked'] as RxBool,
                onLike: () {
                  if ((post['isDisLiked'] as RxBool).value) {
                    (post['isDisLiked'] as RxBool).value = false;
                  }
                  (post['isLiked'] as RxBool).value = !(post['isLiked'] as RxBool).value;
                },
                onDisLike: () {
                  if ((post['isLiked'] as RxBool).value) {
                    (post['isLiked'] as RxBool).value = false;
                  }
                  (post['isDisLiked'] as RxBool).value = !(post['isDisLiked'] as RxBool).value;
                },
                onFollow: controller.toggleFollow,
              );
            }),
          )
        ],
      ).scrollDirection(Axis.vertical),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}