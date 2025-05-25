import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String email;
  final String userImage;
  final String userType; // إضافة نوع المستخدم
  final CustomDrawerController controller = Get.put(CustomDrawerController());

  CustomDrawer({
    super.key,
    required this.userName,
    required this.email,
    required this.userImage,
    required this.userType, // إضافة userType كمعامل
  }) {
    controller.setData(userName, email, userImage, userType);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      backgroundColor: AppColors.pureWhite,
      child: Obx(() {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.pureWhite),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.pureWhite,
                    backgroundImage: controller.userImage.value.startsWith('http')
                        ? NetworkImage(controller.userImage.value)
                        : AssetImage(controller.userImage.value) as ImageProvider,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.userName.value,
                        style: Fonts.itim.copyWith(
                          color: AppColors.grey,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        controller.email.value,
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
            DrawerItem(
              icon: Icons.confirmation_number,
              title: 'my tickets',
              onTap: () {
                Get.toNamed('/home');
              },
            ),
            DrawerItem(
              icon: Icons.language,
              title: 'language',
              onTap: () {
                Get.toNamed('/home');
              },
            ),
            // شرط إضافة "My Property" و"Add New Property" إذا كان نوع المستخدم "عقارات"
            if (controller.userType.value == "عقارات") ...[
              DrawerItem(
                icon: Icons.home,
                title: 'my property',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/my_property');
                },
              ),
              DrawerItem(
                icon: Icons.add_home,
                title: 'add new property',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/add_new_property');
                },
              ),
            ],
            DrawerItem(
              icon: Icons.settings,
              title: 'FAQ support',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/faq');
              },
            ),
            DrawerItem(
              icon: Icons.info,
              title: 'about us',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            DrawerItem(
              icon: Icons.policy,
              title: 'condition & terms',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/terms');
              },
            ),
            DrawerItem(
              icon: Icons.logout,
              title: 'log out',
              onTap: () {
                print("Logout....");
              },
            ),
          ],
        );
      }),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.grey,
        size: 25,
      ),
      title: Text(
        title,
        style: Fonts.itim.copyWith(
          color: AppColors.grey,
          fontSize: 18,
        ),
      ),
      onTap: onTap,
    );
  }
}

class CustomDrawerController extends GetxController {
  var userName = ''.obs;
  var email = ''.obs;
  var userImage = ''.obs;
  var userType = ''.obs;
  VoidCallback? onTap;

  void setData(
      String name,
      String emailVal,
      String image,
      String type,
      ) {
    userName.value = "name";
    email.value = "emailVal";
    userImage.value = AppImages.user;
    userType.value = type;
  }
}