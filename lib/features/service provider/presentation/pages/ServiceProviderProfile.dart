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
import '../../data/model/get_properties_by_officeId/propertiesByOfficeId_model.dart';
import '../controllers/ServiceProviderProfileController.dart';
import '../widgets/Custom_ServiceProviderProfile.dart';
import 'package:graduation_project/features/chats/presentation/controllers/room_controller.dart';
import 'package:graduation_project/features/officers/data/model/office.dart' as officersOffice;

class Serviceproviderprofile extends StatelessWidget {
  const Serviceproviderprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final String id = args['id'].toString();
    final String role = args['role'].toString();
    final UserOffice? user = args['user'];
    final controller = Get.put(ServiceProviderProfileController(id, role));
    final roomController = Get.find<RoomController>();

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
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.serviceProvider.isEmpty) {
          return const Center(child: Text("لم يتم العثور على مزود الخدمة."));
        }

        final provider = controller.serviceProvider;

        return CustomServiceproviderprofile(
          image: controller.getValidImageUrl(provider),
          name: provider['name'] ?? "بدون اسم",
          job: provider['jobTitle'] ?? "غير معروف",
          rating: provider['rating']?.toString() ?? "0",
          experience: provider['experienceYears']?.toString() ?? "0",
          successCount: provider['rateCount']?.toString() ?? "0",
          followerNum: controller.followers.value.toString(),
          followers: controller.followersText,
          onFavourite: controller.toggleFavourite,
          isFavourite: controller.isFavourite.value,
          isFollow: controller.isFollowing.value,
          onFollow: controller.toggleFollow,
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
                      'successCount': provider['rateCount']?.toString() ?? "0",
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

          posts: [],

          // controller.posts.map((post) {
          //   return {
          //     'postImage': post['postImage'],
          //     'username': post['username'],
          //     'userImage': post['userImage'],
          //     'postText': post['postText'],
          //     'onTap': () {
          //       Get.toNamed('/PostDetails', arguments: post);
          //     },
          //   };
          // }).toList(),
          properties: controller.properties.map((property) {
            final imageList = property.propertyImageList
                ?.map((img) => PropertyImageModel(
              id: img.id,
              imageUrl: img.imageUrl,
              type: img.type,
            ))
                .toList() ?? [];

            final officeModel = property.office != null
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
              commercialRegisterImage: property.office!.commercialRegisterImage,
            )
                : null;

            return {
              'imagePath': imageList.isNotEmpty ? imageList.first.imageUrl : AppImages.noImage,
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

                Get.toNamed(AppRoutes.propertyDetails, arguments: propertyModel);
              },
            };
          }).toList(),
          onTap: () {},
          postImages: [],
          discounts: [],
        );
      }),
    );
  }
}
