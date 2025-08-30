import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/view_image_page.dart';
import 'package:graduation_project/features/profiles/presentation/controllers/expert_profile_controller.dart';

class ExpertProfileScreen extends StatelessWidget {
  final ExpertProfileController controller =
      Get.find<ExpertProfileController>();

  ExpertProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.deepNavy,
        onPressed: () => controller.fetchExpertByRole(),
        child: const Icon(Icons.refresh, color: AppColors.pureWhite),
      ),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ViewImagePage(MemoryImage(controller.image.value!));
                },
              );
            },
            icon: Icon(Icons.qr_code, color: AppColors.pureWhite),
          ),
        ],

        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
          color: AppColors.pureWhite,
        ),
        title: Text(
          "Expert Profile",
          style: GoogleFonts.itim(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.pureWhite,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.deepNavy,
        elevation: 4,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              controller.errorMessage.value,
              style: GoogleFonts.itim(fontSize: 18, color: Colors.red),
            ),
          );
        }

        final profile = controller.expertProfile.value?.data;
        if (profile == null) {
          return Center(
            child: Text(
              "No profile data available",
              style: GoogleFonts.itim(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => controller.pickAndUploadUserImage(),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          profile.user?.imageUrl != null
                              ? NetworkImage(profile.user!.imageUrl!)
                              : const AssetImage(
                                    "assets/images/default_avatar.png",
                                  )
                                  as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.deepNavy,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    Obx(
                      () =>
                          controller.isUploadingImage.value
                              ? Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black38,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                              : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "${profile.user?.firstName ?? ''} ${profile.user?.lastName ?? ''}",
                style: GoogleFonts.itim(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              if (profile.profession != null)
                Text(
                  profile.profession!,
                  style: GoogleFonts.itim(fontSize: 18, color: Colors.black54),
                ),
              const SizedBox(height: 20),
              _buildInfoCard("Biography", profile.bio ?? "No bio provided"),
              _buildInfoCard("Experience", profile.experience ?? "N/A"),
              _buildInfoCard(
                "Rating",
                "${profile.rating?.toStringAsFixed(1) ?? "0.0"} ⭐",
              ),
              _buildInfoCard(
                "Followers",
                "${profile.followersCount ?? 0} Followers",
              ),
              _buildInfoCard(
                "Favorites",
                "${profile.favoritesCount ?? 0} Favorites",
              ),
              _buildInfoCard(
                "Video Call Rate",
                "${profile.perMinuteVideo ?? 0} / minute",
              ),
              _buildInfoCard(
                "Audio Call Rate",
                "${profile.perMinuteAudio ?? 0} / minute",
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.info_outline, color: AppColors.aquaBlue),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.itim(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    value,
                    style: GoogleFonts.itim(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
