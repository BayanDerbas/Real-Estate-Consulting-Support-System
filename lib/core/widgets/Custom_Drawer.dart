import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/app_keys.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/utils/secure_storage.dart';
import 'package:graduation_project/core/utils/shard_prefs.dart';
import 'package:graduation_project/features/ticket/presentation/controllers/my_tickets_controller.dart';
import '../../features/FAQs_Support/presentation/pages/faq-s_support.dart';
import '../../features/officers/presentation/pages/office_profile_page.dart';
import '../di/bindings/faqs_binding.dart';
import '../translation/locale_controller.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String email;
  final String userImage;
  final String userType;
  final CustomDrawerController controller = Get.put(CustomDrawerController());

  CustomDrawer({
    super.key,
    required this.userName,
    required this.email,
    required this.userImage,
    required this.userType,
  }) {
    controller.setData(userName, email, userImage, userType);
  }

  @override
  Widget build(BuildContext context) {
    final languageController = Get.find<LanguageController>();
    print("Name : ${controller.userName} ${controller.userType}");
    return SizedBox(
      width: 360,
      child: Drawer(
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
                      backgroundImage:
                          controller.userImage.value.startsWith('http')
                              ? NetworkImage(controller.userImage.value)
                              : AssetImage(controller.userImage.value)
                                  as ImageProvider,
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
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          controller.email.value,
                          style: Fonts.itim.copyWith(
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              DrawerItem(
                icon: Icons.person,
                title: 'My Profile',
                onTap: () {
                  Get.back();
                  Get.to(() => const ProfileExpertPage());
                },
              ),

              DrawerItem(
                icon: Icons.confirmation_number,
                title: 'my tickets',
                onTap: () {
                  Get.find<MyTicketsController>().fetchTickets(page: 0);
                  Get.toNamed(AppRoutes.myTickets);
                },
              ),

              DrawerItem(
                icon: Icons.language,
                title: 'language',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(
                              'English',
                              style: Fonts.itim.copyWith(
                                color: AppColors.grey,
                                fontSize: 18,
                              ),
                            ),
                            onTap: () {
                              languageController.changeLanguage('en');
                              Get.back();
                            },
                          ),
                          ListTile(
                            title: Text(
                              'العربية',
                              style: Fonts.itim.copyWith(
                                color: AppColors.grey,
                                fontSize: 18,
                              ),
                            ),
                            onTap: () {
                              languageController.changeLanguage('ar');
                              Get.back();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              if (controller.userType.value == "OFFICE") ...[
                DrawerItem(
                  icon: Icons.home,
                  title: 'my property',
                  onTap: () {
                    Get.offAllNamed(AppRoutes.filteredTickets);
                    // Get.back(
                    // Get.toNamed('/my_property');
                  },
                ),
                DrawerItem(
                  icon: Icons.add_home,
                  title: 'add new property',
                  onTap: () {
                    Get.back();
                    Get.toNamed('/add_new_property');
                  },
                ),
              ],

              if (controller.userType.value == "EXPERT") ...[
                DrawerItem(
                  icon: Icons.home,
                  title: 'my available times',
                  onTap: () {
                    Get.back();
                    Get.toNamed(AppRoutes.myTimes);
                  },
                ),
              ],

              DrawerItem(
                icon: Icons.add_home,
                title: 'my reservations',
                onTap: () {
                  Get.back();
                  //Get.toNamed(AppRoutes.appointements);
                  Get.toNamed(AppRoutes.myReserve);
                },
              ),
              DrawerItem(
                icon: Icons.settings,
                title: 'FAQ support',
                onTap: () {
                  Get.back();
                  Get.to(() => FAQS_support(), binding: FAQsBinding());
                  //Get.toNamed('/FAQs');
                },
              ),
              DrawerItem(
                icon: Icons.info,
                title: 'about us',
                onTap: () {
                  Get.back();
                  Get.toNamed('/about');
                },
              ),
              DrawerItem(
                icon: Icons.policy,
                title: 'condition & terms',
                onTap: () {
                  Get.back();
                  Get.toNamed('/terms');
                },
              ),
              DrawerItem(
                icon: Icons.logout,
                title: 'log out',
                onTap: () {
                  SharedPrefs.removeKey(AppKeys.toRoute);
                  SecureStorage().deleteToken();
                  SecureStorage().deleteRefreshToken();
                  Get.offAllNamed(AppRoutes.login);
                  print("Logout....");
                },
              ),
            ],
          );
        }),
      ),
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
      leading: Icon(icon, color: AppColors.grey, size: 25),
      title: Text(
        title,
        style: Fonts.itim.copyWith(color: AppColors.grey, fontSize: 18),
      ),
      onTap: onTap,
    );
  }
}

class CustomDrawerController extends GetxController {
  final SecureStorage _storage = SecureStorage();

  var userName = ''.obs;
  var email = ''.obs;
  var userImage = ''.obs;
  var userType = ''.obs;

  void setData(String name, String emailVal, String image, String type) async {
    userName.value = await _storage.getUserName() ?? name;
    email.value = await _storage.getEmail() ?? emailVal;
    userType.value = await _storage.getUserType() ?? type;

    final storedImage = await _storage.getUserImageByRole();
    userImage.value =
        (storedImage != null && storedImage.isNotEmpty)
            ? storedImage
            : AppImages.user;
  }
}
