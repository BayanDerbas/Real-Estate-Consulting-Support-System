import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/image_paths.dart';

class Customposts extends StatelessWidget {
  final String name;
  final String userImage;
  final String IconFollow;
  final String postingTime;
  final String postText;
  final String postImage;
  final VoidCallback? onLike;
  final VoidCallback? onDisLike;
  final RxBool isLiked;
  final RxBool isDisLiked;

  const Customposts({
    super.key,
    required this.name,
    required this.userImage,
    this.IconFollow = AppImages.follow,
    required this.postingTime,
    required this.postText,
    required this.postImage,
    this.onLike,
    this.onDisLike,
    required this.isLiked,
    required this.isDisLiked
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightGrey,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(userImage),
                      radius: 20,
                      backgroundColor: AppColors.deepNavy,
                    ),
                    SizedBox(width: 5,),
                    Text(name,style: Fonts.itim.copyWith(color: AppColors.black,fontSize: 20),),
                    SizedBox(width: 8,),
                    Image.asset(IconFollow,scale: 12,),
                  ],
                ),
                Text(postText,style: Fonts.itim.copyWith(color: AppColors.grey,fontSize: 18),overflow: TextOverflow.visible,),
                SizedBox(height: 13,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(postImage),
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() => IconButton(
                        onPressed: onLike,
                        icon: Icon(
                          Icons.thumb_up,
                          color: isLiked.value ? AppColors.lavender : AppColors.grey,
                        ),
                    ),
                    ),
                    Obx(() => IconButton(
                      onPressed: onDisLike,
                      icon: Icon(
                        Icons.thumb_down,
                        color: isDisLiked.value ? AppColors.lavender : AppColors.grey,
                      ),
                    ),
                    ),
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }
}
