import 'package:flutter/material.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';

class CustomPropertyDetails extends StatelessWidget {
  final List<String> images;
  final String imagePath;
  final String price;
  final String title;
  final String location;
  final String area;
  final String beds;
  final String priceInMonth;
  final String room;
  final String baths;
  final String details;
  final String serviceType;
  final int selectedIndex;
  final Function(int index) onImageTap;
  final Function(DragEndDetails details) onSwipe;

  const CustomPropertyDetails({
    super.key,
    required this.imagePath,
    required this.price,
    required this.title,
    required this.location,
    required this.area,
    required this.beds,
    required this.baths,
    required this.details,
    required this.serviceType,
    required this.images,
    required this.selectedIndex,
    required this.onImageTap,
    required this.onSwipe,
    required this.priceInMonth,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> allImages = [imagePath, ...images];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onHorizontalDragEnd: onSwipe,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network(
                      allImages[selectedIndex],
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Image.asset(
                            AppImages.noImage,
                            width: double.infinity,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.pureWhite,
                      size: 35,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.pureWhite,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.5),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      '$priceInMonth\$/monthly',
                      style: Fonts.itim.copyWith(
                        color: AppColors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(allImages.length, (index) {
              return GestureDetector(
                onTap: () => onImageTap(index),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        allImages[index],
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => Image.asset(
                              AppImages.noImage,
                              fit: BoxFit.cover,
                            ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: Fonts.itim.copyWith(color: AppColors.black, fontSize: 24),
          ).padding(EdgeInsets.symmetric(horizontal: 16)),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.location_on, size: 22, color: AppColors.grey),
              const SizedBox(width: 5),
              Text(
                location,
                style: Fonts.itim.copyWith(color: AppColors.grey, fontSize: 18),
              ),
            ],
          ).padding(EdgeInsets.symmetric(horizontal: 16)),
          Row(
            children: [
              const Icon(
                Icons.real_estate_agent,
                size: 22,
                color: AppColors.grey,
              ),
              const SizedBox(width: 5),
              Text(
                serviceType,
                style: Fonts.itim.copyWith(color: AppColors.grey, fontSize: 18),
              ),
            ],
          ).padding(EdgeInsets.symmetric(horizontal: 16)),
          Row(
            children: [
              const Icon(Icons.attach_money, size: 22, color: AppColors.grey),
              const SizedBox(width: 5),
              Text(
                'monthly : $priceInMonth',
                style: Fonts.itim.copyWith(color: AppColors.grey, fontSize: 18),
              ),
            ],
          ).padding(EdgeInsets.symmetric(horizontal: 16)),
          Row(
            children: [
              const Icon(Icons.attach_money, size: 22, color: AppColors.grey),
              const SizedBox(width: 5),
              Text(
                'annual : $price',
                style: Fonts.itim.copyWith(color: AppColors.grey, fontSize: 18),
              ),
            ],
          ).padding(EdgeInsets.symmetric(horizontal: 16)),
          const SizedBox(height: 20),
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoCard(Icons.aspect_ratio, '$area m²'),
                  SizedBox(width: 5),
                  _buildInfoCard(Icons.bed, '$beds BedRooms '),
                  SizedBox(width: 5),
                  _buildInfoCard(Icons.meeting_room, '$room LivingRooms '),
                  SizedBox(width: 5),
                  _buildInfoCard(Icons.bathtub, '$baths BathRooms'),
                ],
              )
              .padding(EdgeInsets.symmetric(horizontal: 10))
              .scrollDirection(Axis.horizontal),
          const SizedBox(height: 20),
          Text(
            'Details',
            style: Fonts.itim.copyWith(color: AppColors.black, fontSize: 24),
          ).padding(EdgeInsets.symmetric(horizontal: 16)),
          const SizedBox(height: 10),
          Text(
            details,
            style: Fonts.itim.copyWith(color: AppColors.grey, fontSize: 16),
          ).padding(EdgeInsets.symmetric(horizontal: 16)),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.lightGrey,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: AppColors.darkGray),
          const SizedBox(width: 5),
          Text(
            text,
            style: Fonts.itim.copyWith(color: AppColors.darkGray, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
