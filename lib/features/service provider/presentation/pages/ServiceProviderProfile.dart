import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/properties/data/model/property_model.dart';
import 'package:zego_uikit/zego_uikit.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';
import 'package:graduation_project/core/routes/routes.dart';
import 'package:graduation_project/core/widgets/Custom_Appbar.dart';
import '../../../officers/data/model/userOffice.dart';
import '../../../properties/data/model/propertyImage_model.dart';
import '../../data/repository/expert_posts_repository.dart';
import '../controllers/ServiceProviderProfileController.dart';
import '../controllers/ServiceProvidersControllers.dart';
import '../controllers/expert_posts_controller.dart';
import '../controllers/rating_controller.dart';
import '../widgets/CustomCardPost.dart';
import '../widgets/Custom_ServiceProviderProfile.dart';
import 'package:graduation_project/features/chats/presentation/controllers/room_controller.dart';
import 'package:graduation_project/features/officers/data/model/office.dart'
    as officersOffice;

class Serviceproviderprofile extends StatelessWidget {
  const Serviceproviderprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final String id = args['id'].toString();
    final String role = args['role'].toString();
    final UserOffice? user = args['user'];
    final controller_ = Get.find<ServiceProviders_Controller>();
    final controller = Get.put(ServiceProviderProfileController(id, role));
    final roomController = Get.find<RoomController>();
    final postsController = Get.put(
      ExpertPostsController(Get.find<ExpertPostsRepository>(), int.parse(id)),
    );
    final ratingController = Get.find<RatingController>();
    ratingController.initRating(int.parse(id), role);

    return Scaffold(
      floatingActionButton:
          user != null
              ? ZegoSendCallInvitationButton(
                isVideoCall: true,
                resourceID: "realEstateCons",
                invitees: [
                  ZegoUIKitUser(
                    id: user.id.toString(),
                    name: user.firstName.toString(),
                  ),
                ],
              )
              : null,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: CustomAppbar(
          text: "Service Provider Profile",
          icon: Icons.notifications,
          iconColor: AppColors.pureWhite,
          onPressed: () {
            Get.toNamed(AppRoutes.notifications);
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          try {
            await controller.fetchProviderByIdAndRole(id, role);
            await postsController.fetchPosts();
            ratingController.initRating(int.parse(id), role);
            await controller_.filter();
          } catch (e) {
            Get.snackbar(
              "Error",
              "Failed to refresh data",
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.serviceProvider.isEmpty) {
            return const Center(child: Text("لم يتم العثور على مزود الخدمة."));
          }
          final provider = controller.serviceProvider;
          final expertId = int.parse(id);
          final isFollowing =
              controller_.isFollowingList[expertId] ?? false.obs;
          return CustomServiceproviderprofile(
            image: controller.getValidImageUrl(provider),
            name: provider['name'] ?? "بدون اسم",
            job: provider['jobTitle'] ?? "غير معروف",
            profileRole: provider['jobTitle'] ?? "UNKNOWN",
            rating: provider['rating']?.toString() ?? "0",
            experience: provider['experienceYears']?.toString() ?? "0",
            successCount: provider['rateCount']?.toString() ?? "0",
            followerNum: provider['followersCount']?.toString() ?? "0",
            followers: controller.followersText,
            onFavourite: () async {
              await controller_.toggleFavorite(expertId);
            },
            isFavourite: controller_.isFavoriteList[expertId]?.value ?? false,
            isFollow: isFollowing.value,
            onFollow: () async {
              if (isFollowing.value) {
                await controller_.unfollowExpert(expertId);
                controller.followers.value--;
              } else {
                await controller_.followExpert(expertId);
                controller.followers.value++;
              }
            },
            role: controller_.role.value,
            onBook:
                role.toLowerCase() != "office"
                    ? () => Get.toNamed(
                      '/Book',
                      arguments: {
                        'id': id,
                        'name': provider['name'] ?? "بدون اسم",
                        'job': provider['jobTitle'] ?? "غير معروف",
                        'rating': provider['rating']?.toString() ?? "0",
                        'experience':
                            provider['experienceYears']?.toString() ?? "0",
                        'successCount':
                            provider['rateCount']?.toString() ?? "0",
                        'expert': provider,
                      },
                    )
                    : null,
            onMessage: () {
              if (user != null) {
                roomController.findOrCreateRoom(user);
              } else {
                Get.snackbar(
                  'Error',
                  'User data is missing to start a chat.',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            onCall: () {},
            followerImages: [AppImages.expert, AppImages.user],
            description: provider['textProvider'] ?? "لا يوجد وصف",
            realEstateImages:
                controller.properties
                    .expand(
                      (property) =>
                          property.propertyImageList
                              ?.map((img) => img.imageUrl ?? "")
                              .where((url) => url.isNotEmpty) ??
                          [],
                    )
                    .cast<String>()
                    .toList(),
            posts:
                postsController.posts.map((post) {
                  return {
                    'postImage': post.imageUrl ?? AppImages.noImage,
                    'username':
                        '${post.expert!.firstName} ${post.expert!.lastName}' ??
                        'بدون اسم',
                    'userImage': post.expert!.imageUrl ?? AppImages.noImage,
                    'postText': post.content ?? 'لا يوجد نص',
                    'onTap': () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: CustomCardPost(
                                    username:
                                        '${post.expert!.firstName} ${post.expert!.lastName}' ??
                                        'بدون اسم',
                                    userImage:
                                        post.expert!.imageUrl ??
                                        AppImages.noImage,
                                    postText: post.content ?? 'لا يوجد نص',
                                    postImage:
                                        post.imageUrl ?? AppImages.noImage,
                                  ),
                                ),
                              ),
                            ),
                      );
                    },
                  };
                }).toList(),
            properties:
                controller.properties.map((property) {
                  final imageList =
                      property.propertyImageList
                          ?.map(
                            (img) => PropertyImageModel(
                              id: img.id,
                              imageUrl: img.imageUrl,
                              type: img.type,
                            ),
                          )
                          .toList() ??
                      [];

                  final officeModel =
                      property.office != null
                          ? officersOffice.Office(
                            id: property.office!.id,
                            userId: property.office!.userId,
                            firstName: property.office!.firstName,
                            lastName: property.office!.lastName,
                            email: property.office!.email,
                            phone: property.office!.phone,
                            imageUrl: property.office!.imageUrl,
                            user: property.office!.user,
                            bio: property.office!.bio,
                            commercialRegisterImage:
                                property.office!.commercialRegisterImage,
                          )
                          : null;

                  return {
                    'imagePath':
                        imageList.isNotEmpty
                            ? imageList.first.imageUrl
                            : AppImages.noImage,
                    'place': property.location ?? "غير محدد",
                    'propertyType': property.houseType ?? "غير معروف",
                    'propertyIcon': Icons.home,
                    'onTap': () {
                      final propertyModel = PropertyModel(
                        id: property.id,
                        houseType: property.houseType,
                        location: property.location,
                        price: property.price,
                        priceInMonth: property.priceInMonth,
                        numberOfRooms: property.numberOfRooms,
                        numberOfBed: property.numberOfBed,
                        numberOfBathrooms: property.numberOfBathrooms,
                        description: property.description,
                        serviceType: property.serviceType,
                        propertyImageList: imageList,
                        office: officeModel,
                        direction: property.direction,
                        area: property.area,
                        latitude: property.latitude,
                        longitude: property.longitude,
                      );

                      Get.toNamed(
                        AppRoutes.propertyDetails,
                        arguments: propertyModel,
                      );
                    },
                  };
                }).toList(),
            onTap: () {
              // if (posts.isNotEmpty) {
              //   final post = posts.first;
              //   showDialog(
              //     context: context,
              //     builder: (context) => Dialog(
              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              //       child: SingleChildScrollView(
              //         child: Padding(
              //           padding: const EdgeInsets.all(12.0),
              //           child: CustomCardPost(
              //             username: post['username'] ?? 'بدون اسم',
              //             userImage: post['userImage'] ?? AppImages.noImage,
              //             postText: post['postText'] ?? 'لا يوجد نص',
              //             postImage: post['postImage'] ?? AppImages.noImage,
              //           ),
              //         ),
              //       ),
              //     ),
              //   );
              //}
            },
            postImages:
                postsController.posts
                    .map((post) => post.imageUrl ?? AppImages.noImage)
                    .toList(),
            discounts:
                controller.coupons.asMap().entries.map((entry) {
                  final index = entry.key;
                  final coupon = entry.value;

                  return {
                    'discount': "${coupon.discountValue ?? ''}%",
                    'description': coupon.description ?? 'لا يوجد وصف',
                    'code': coupon.code ?? '',
                    'color':
                        controller.discountColors[index %
                            controller.discountColors.length],
                    'onTap': () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "كود الخصم",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      coupon.code ?? "بدون كود",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(coupon.description ?? "لا يوجد وصف"),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () => Get.back(),
                                      child: const Text("إغلاق"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      );
                    },
                  };
                }).toList(),
            onRatingChanged: (double value) {
              ratingController.rateServiceProvider(
                role: role,
                id: int.parse(id),
                rate: value,
              );
              Get.snackbar(
                "التقييم",
                "تم إرسال تقييمك: $value",
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            rate:
                ratingController.lastRating.value == 0.0
                    ? double.tryParse(provider['rating']?.toString() ?? "0") ??
                        0
                    : ratingController.lastRating.value,
            onreport: () {
              final reportedId = provider['id'];
              print("DEBUG: reportedId قبل الانتقال = $reportedId");

              if (role.toLowerCase() == "office") {
                Get.toNamed(
                  AppRoutes.report_categories,
                  arguments: {
                    "reportedId": reportedId,
                    "reportedRole": "office",
                  },
                );
              } else {
                Get.toNamed(
                  AppRoutes.report_categories,
                  arguments: {
                    "reportedId": reportedId,
                    "reportedRole": "expert",
                  },
                );
              }
            },
          );
        }),
      ),
    );
  }
}
