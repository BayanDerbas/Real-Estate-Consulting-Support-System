import 'package:flutter/material.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';

class CustomPropertyDetails extends StatelessWidget {
  final List<String> images;
  final String imagePath;
  final String price;
  final String title;
  final String location;
  final String area;
  final String beds;
  final String baths;
  final String details;
  final int selectedIndex;
  final Function(int index) onImageTap;
  final Function(DragEndDetails details) onSwipe;

  const CustomPropertyDetails({
    Key? key,
    required this.imagePath,
    required this.price,
    required this.title,
    required this.location,
    required this.area,
    required this.beds,
    required this.baths,
    required this.details,
    required this.images,
    required this.selectedIndex,
    required this.onImageTap,
    required this.onSwipe,
  }) : super(key: key);

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
                    child: Image.asset(
                      allImages[selectedIndex],
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
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
                  top: 10,
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
                      '$price/month',
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
                      image: DecorationImage(
                        image: AssetImage(allImages[index]),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: Fonts.itim.copyWith(color: AppColors.black, fontSize: 26),
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

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoCard(Icons.aspect_ratio, area),
              _buildInfoCard(Icons.bed, '$beds beds'),
              _buildInfoCard(Icons.bathtub, '$baths baths'),
            ],
          ).padding(EdgeInsets.symmetric(horizontal: 16)),
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
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.lightGrey,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
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
