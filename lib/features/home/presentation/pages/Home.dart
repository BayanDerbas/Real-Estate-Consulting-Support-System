import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import 'package:graduation_project/core/widgets/Custom_Drawer.dart';
import 'package:graduation_project/features/home/presentation/widgets/Custom_OfficeCard.dart';
import 'package:graduation_project/features/home/presentation/widgets/Custom_Post.dart';
import 'package:graduation_project/features/properties/data/repository/property_repository.dart';
import 'package:graduation_project/features/properties/presentation/controllers/Properties_Controller.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/Custom_Appbar.dart';
import '../../../officers/presentation/controllers/OfficeController.dart';
import '../../../properties/data/data_source/property_service.dart';
import '../../../service provider/presentation/controllers/ServiceProvidersControllers.dart';
import '../widgets/Custom_BottomBar.dart';
import '../widgets/Custom_ExpertCard.dart';
import '../../../../core/widgets/Custom_IconButton.dart';
import '../widgets/Custom_QuickAccess.dart';
import '../controllers/Home_Controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceProviders_Controller expertController = Get.put(
      ServiceProviders_Controller(),
    );
    final HomeController controller = Get.put(HomeController());
    final CustomDrawerController drawerController = Get.put(
      CustomDrawerController(),
    );
    final repository = PropertyRepository(PropertyService(Dio()));
    final PropertiesController propertiesController = Get.put(
      PropertiesController(repository),
    );
    final OfficeController officeController = Get.find();

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
          icon:Icons.notifications,
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
            final isFavorite = expertController.isFavoriteList[index] ?? false.obs;
            final isFollowing = expertController.isFollowingList[index] ?? false.obs;

            return CustomExpertCard(
              name: expert['name'],
              jobTitle: expert['jobTitle'],
              rating: expert['rating'],
              experienceYears: int.tryParse(expert['experienceYears'].toString()) ?? 0,
              successfulCases: expert['rateCount'],
              appointmentDate: 'غير محدد',
              appointmentTime: 'غير محدد',
              imagePath: expert['idCardImage'],
              isFavorite: isFavorite.value,
              onFavoriteToggle: () => expertController.toggleFavorite(index),
              onProfileTap: () {
                Get.toNamed('/serviceProvider_profile', arguments: {
                  'id': expert['id'].toString(),
                  'role': 'EXPERT',
                });
              },
              onFollowToggle: () => expertController.toggleFollowing(index),
              isFollowing: isFollowing.value,
            );
          }),
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
          ).padding(const EdgeInsets.all(8)),
          Obx(() {
            if (officeController.isLoading.value ||
                officeController.officesList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            final office = officeController.officesList.first;
            final index = officeController.officesList.indexOf(office);
<<<<<<< HEAD
            final isFavorite = officeController.isFavoriteList[index]?.value ?? false;
            final isFollowing = officeController.isFollowingList[index]?.value ?? false;
=======
            final state =
                officeController.officeStates[index] ??
                {"isFavorite": false, "isFollowing": false};

>>>>>>> c7d731dd450c376d00dc6594eb046f0831d21a99
            return CustomOfficeCard(
              name: '${office.user.firstName} ${office.user.lastName}',
              bio: office.bio,
              location: office.location,
              imageUrl: office.commercialRegisterImage,
              isFavorite: isFavorite,
              isFollowing: isFollowing,
              onFavoriteToggle: () {
                officeController.toggleFavorite(index);
              },
              onFollowToggle: () {
                officeController.toggleFollow(index);
              },
<<<<<<< HEAD
              onProfileTap: () {
                print("\n press on office");
                Get.toNamed('/serviceProvider_profile', arguments: {
                  'id': office.id.toString(),
                  'role': 'OFFICE',
                });
              },
=======
              onProfileTap: () {},
>>>>>>> c7d731dd450c376d00dc6594eb046f0831d21a99
            );

          }),
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
                onFollow: controller.toggleFollow,
              );
            }),
          ),
        ],
      ).scrollDirection(Axis.vertical),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
