import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Drawer.dart';
import 'package:graduation_project/features/Discounts/presentation/controllers/DiscountsController.dart';
import 'package:graduation_project/features/home/presentation/widgets/Custom_Post.dart';
import 'package:graduation_project/features/properties/presentation/controllers/Properties_Controller.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../../../Discounts/presentation/controllers/DiscountsController.dart';
import '../../../officers/presentation/controllers/OfficeController.dart';
import '../../../posts/presentation/controllers/PostsController.dart';
import '../../../service provider/presentation/controllers/ServiceProvidersControllers.dart';
import '../widgets/Custom_BottomBar.dart';
import '../widgets/Custom_ExpertCard.dart';
import '../../../../core/widgets/Custom_IconButton.dart';
import '../widgets/Custom_QuickAccess.dart';
import '../controllers/Home_Controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final expertController = Get.find<ServiceProviders_Controller>();
    final drawerController = Get.find<CustomDrawerController>();
    final propertiesController = Get.find<PropertiesController>();
    final officeController = Get.find<OfficeController>();
    final PostsController _controller = Get.find<PostsController>();
    final discountsController = Get.find<DiscountsController>();
    return Scaffold(
      drawer: CustomDrawer(
        userName: drawerController.userName.value,
        email: drawerController.email.value,
        userImage: drawerController.userImage.value,
        userType: 'عقارات',
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Welcome Home",
          icon: Icons.notifications,
          onPressed: () {
            Get.toNamed(AppRoutes.notifications);
          },
          iconColor: AppColors.pureWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Row(
                children: [
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
                    onTap: () {
                      controller.selectIndex(4);
                        Get.toNamed("/serviceProviders");
                      },
                  ),
                  CustomIconButton(
                    icon: Icons.discount,
                    label: 'Discounts',
                    isSelected: controller.selectedIndex.value == 8,
                    onTap: () {
                      controller.selectIndex(8);
                      Get.toNamed(AppRoutes.all_coupons);
                      print("Discount pressed");
                      // Get.toNamed("/discounts");
                    },
                  ),
                  CustomIconButton(
                    icon: Icons.confirmation_number,
                    label: 'Tickets',
                    isSelected: controller.selectedIndex.value == 6,
                    onTap: () {
                      controller.selectIndex(6);
                      print("Tickets pressed");
                      Get.toNamed(AppRoutes.baseTicketsPage);
                    },
                  ),
                  if (
                  //drawerController.userType.value == "OFFICE" ||
                      drawerController.userType.value == "EXPERT" ) ...[
                    // CustomIconButton(
                    //   icon: Icons.bar_chart,
                    //   label: 'Statistics',
                    //   isSelected: controller.selectedIndex.value == 5,
                    //   onTap: () {
                    //     controller.selectIndex(5);
                    //     print("Statistics pressed");
                    //     // Get.toNamed("/statistics");
                    //   },
                    // ),
                    CustomIconButton(
                      icon: Icons.schedule,
                      label: 'Schedule Time',
                      isSelected: controller.selectedIndex.value == 7,
                      onTap: () {
                        controller.selectIndex(7);
                        Get.toNamed(AppRoutes.scheduleTime);
                        print("Schedule Time pressed");
                        // Get.toNamed("/schedule_time");
                      },
                    ),

                  ],
                ],
              ).scrollDirection(Axis.horizontal),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (propertiesController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              final propertyWidgets =
                  propertiesController.propertiesList.take(4).toList();
              return SizedBox(
                height: 270,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: propertyWidgets.length + 1,
                  itemBuilder: (context, index) {
                    if (index < propertyWidgets.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: propertyWidgets[index],
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () => Get.toNamed('/properties'),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 30,
                            color: AppColors.deepNavy,
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            }),
            const SizedBox(height: 5),
            Text(
              "Quick Access",
              style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 24),
            ).padding(const EdgeInsets.all(8)),
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
            SizedBox(height: 15,),
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
                    Get.toNamed("/serviceProviders");
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
            ).padding(const EdgeInsets.all(8)),
            Obx(() {
              if (expertController.serviceProviders.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              final expert = expertController.serviceProviders.first;
              final index = expertController.serviceProviders.indexOf(expert);
              final isFavorite =
                  expertController.isFavoriteList[index] ?? false.obs;
              final isFollowing =
                  expertController.isFollowingList[index] ?? false.obs;

              return CustomExpertCard(
                name: expert['name'],
                jobTitle: expert['jobTitle'],
                rating: expert['rating'],
                experienceYears:
                    int.tryParse(expert['experienceYears'].toString()) ?? 0,
                successfulCases: expert['rateCount'],
                appointmentDate: 'غير محدد',
                appointmentTime: 'غير محدد',
                imagePath: expert['idCardImage'],
                isFavorite: isFavorite.value,
                onFavoriteToggle: () => expertController.toggleFavorite(index),
                onProfileTap: () {
                  Get.toNamed(
                    '/serviceProvider_profile',
                    arguments: {'id': expert['id'].toString(), 'role': 'EXPERT'},
                  );
                },
                onFollowToggle: () => expertController.toggleFollowing(index),
                isFollowing: isFollowing.value,
              );
            }),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Offices",
                  style: Fonts.itim.copyWith(
                    color: AppColors.black,
                    fontSize: 24,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/offices');
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
            ).padding(const EdgeInsets.all(8)),
            Obx(() {
              if (officeController.officesList.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              final office = officeController.officesList.first;
              final index = officeController.officesList.indexOf(office);

              final isFavorite =
                  officeController.isFavoriteList[index]?.value ?? false;
              final isFollowing =
                  officeController.isFollowingList[index]?.value ?? false;

              return CustomExpertCard(
                name:
                    '${office.user?.firstName ?? ""} ${office.user?.lastName ?? ""}',
                jobTitle: office.user!.role ?? "غير معروف",
                rating: 0,
                experienceYears: 0,
                successfulCases: 2,
                appointmentDate: 'غير محدد',
                appointmentTime: 'غير محدد',
                imagePath: office.imageUrl ?? '',
                isFavorite: isFavorite,
                isFollowing: isFollowing,
                onFavoriteToggle: () => officeController.toggleFavorite(index),
                onFollowToggle: () => officeController.toggleFollow(index),
                onProfileTap: () {
                  print("زيارة ملف المكتب: ${office.user?.id}");
                  Get.toNamed(
                    '/serviceProvider_profile',
                    arguments: {
                      'id': office.id,
                      'role': 'OFFICE',
                      'user': office.user,
                    },
                  );
                },
              );
            }),
            SizedBox(height: 15,),
            Text(
              "Posts",
              style: Fonts.itim.copyWith(color: AppColors.deepNavy, fontSize: 24),
            ).padding(const EdgeInsets.all(8)),
            Obx(() {
              if (_controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (_controller.errorMessage.isNotEmpty) {
                return Center(child: Text(_controller.errorMessage.value));
              }
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _controller.postsList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final post = _controller.postsList[index];
                  return CustomPost(
                    username: "${post.expert?.firstName ?? ""} ${post.expert?.lastName ?? ""}",
                    userImage: post.expert?.imageUrl ?? AppImages.noImage,
                    postText: post.content ?? '',
                    postImage: post.imageUrl ?? AppImages.noData,
                    // isLiked: isLiked,
                    // isDisLiked: isDisLiked,
                  );
                },
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
