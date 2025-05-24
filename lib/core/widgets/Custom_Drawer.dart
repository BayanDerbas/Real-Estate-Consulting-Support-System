import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String email;
  final String userImage;
  final CustomDrawerController controller = Get.put(CustomDrawerController());

  CustomDrawer({
    super.key,
    required this.userName,
    required this.email,
    required this.userImage,
  }) {
    controller.setData(userName, email, userImage);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      backgroundColor: AppColors.pureWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.pureWhite),
              child: Row(children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.pureWhite,
                  backgroundImage: userImage.startsWith('http') ? NetworkImage(userImage) : AssetImage(userImage) as ImageProvider,
                ),
                SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(userName,style: Fonts.itim.copyWith(color: AppColors.grey,fontSize: 20),),
                    Text(email,style: Fonts.itim.copyWith(color: AppColors.grey,fontSize: 16),),
                  ],
                ),
              ],),
          ),
          DrawerItem(
              icon: Icons.confirmation_number,
              title: 'my tickeys',
              onTap: (){
                Get.toNamed('/home');
              }
          ),
          DrawerItem(
              icon: Icons.language,
              title: 'language',
              onTap: (){
                Get.toNamed('home');
              }
          ),
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
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerItem({super.key, 
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color:AppColors.grey,size: 25,),
      title: Text(title, style: Fonts.itim.copyWith(color: AppColors.grey,fontSize: 18,)),
      onTap: onTap,
    );
  }
}

class CustomDrawerController extends GetxController {
  var userName = ''.obs;
  var email = ''.obs;
  var userImage = ''.obs;  // Change to String type
  VoidCallback? onTap;

  void setData(
      String name,
      String emailVal,
      String image,
      ) {
    userName.value = "toke alsabbagh";
    email.value = "toka@gmail.com";
    userImage.value = AppImages.user;
  }
}

