import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import 'package:graduation_project/core/widgets/Custom_Drawer.dart';
import 'package:graduation_project/core/widgets/Custom_IconButton.dart';
import 'package:graduation_project/features/home/presentation/controllers/Home_Controller.dart';
import 'package:graduation_project/features/posts/presentation/controllers/PostsController.dart';
import 'package:graduation_project/features/posts/presentation/widgets/CustomPosts.dart';
import '../../../home/presentation/widgets/Custom_BottomBar.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    final PostsController controller = Get.put(PostsController());
    final HomeController homeController = Get.put(HomeController());
    final CustomDrawerController drawerController = Get.put(
      CustomDrawerController(),
    );
    return Scaffold(
      drawer: CustomDrawer(
        userName: drawerController.userName.value,
        email: drawerController.email.value,
        userImage: drawerController.userImage.value,
        userType: 'عقارات',
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
            () => Row(
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
                if (drawerController.userType.value == "عقارات" ||
                    drawerController.userType.value == "محامي" ||
                    drawerController.userType.value == "مهندس") ...[
                  CustomIconButton(
                    icon: Icons.bar_chart,
                    label: 'Statistics',
                    isSelected: controller.selectedIndex.value == 5,
                    onTap: () {
                      controller.selectIndex(5);
                      print("Statistics pressed");
                      // يمكنك إضافة انتقال إلى صفحة الإحصائيات
                      // Get.toNamed("/statistics");
                    },
                  ),
                  CustomIconButton(
                    icon: Icons.confirmation_number,
                    label: 'Tickets',
                    isSelected: controller.selectedIndex.value == 6,
                    onTap: () {
                      controller.selectIndex(6);
                      print("Tickets pressed");
                      // يمكنك إضافة انتقال إلى صفحة التذاكر
                      // Get.toNamed("/tickets");
                    },
                  ),
                  CustomIconButton(
                    icon: Icons.schedule,
                    label: 'Schedule Time',
                    isSelected: controller.selectedIndex.value == 7,
                    onTap: () {
                      controller.selectIndex(7);
                      print("Schedule Time pressed");
                      // يمكنك إضافة انتقال إلى صفحة الجدولة
                      // Get.toNamed("/schedule_time");
                    },
                  ),
                  CustomIconButton(
                    icon: Icons.discount,
                    label: 'Discount',
                    isSelected: controller.selectedIndex.value == 8,
                    onTap: () {
                      controller.selectIndex(8);
                      print("Discount pressed");
                      // يمكنك إضافة انتقال إلى صفحة الخصومات
                      // Get.toNamed("/discounts");
                    },
                  ),
                ],
              ],
            ).scrollDirection(Axis.horizontal),
          ),
          SizedBox(height: 10),
          Obx(
            () => Column(
              children: List.generate(controller.postsList.length, (index) {
                final post = controller.postsList[index];
                return Customposts(
                  name: post['userName']?.toString() ?? '',
                  userImage: post['userImage']?.toString() ?? '',
                  IconFollow: AppImages.follow,
                  postText: post['postText']?.toString() ?? '',
                  postingTime: post['postingTime']?.toString() ?? '',
                  postImage: post['postImage']?.toString() ?? '',
                  isLiked:
                      post['isLiked'] is RxBool
                          ? post['isLiked'] as RxBool
                          : false.obs,
                  isDisLiked:
                      post['isDisLiked'] is RxBool
                          ? post['isDisLiked'] as RxBool
                          : false.obs,
                  onLike: () {
                    if ((post['isDisLiked'] as RxBool).value) {
                      (post['isDisLiked'] as RxBool).value = false;
                    }
                    (post['isLiked'] as RxBool).value =
                        !(post['isLiked'] as RxBool).value;
                  },
                  onDisLike: () {
                    if ((post['isLiked'] as RxBool).value) {
                      (post['isLiked'] as RxBool).value = false;
                    }
                    (post['isDisLiked'] as RxBool).value =
                        !(post['isDisLiked'] as RxBool).value;
                  },
                );
              }),
            ).padding(EdgeInsets.all(10)),
          ),
        ],
      ).scrollDirection(Axis.vertical),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
