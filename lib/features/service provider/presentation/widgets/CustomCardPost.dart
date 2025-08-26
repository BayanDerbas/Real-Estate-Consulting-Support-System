import 'package:flutter/material.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';

class CustomCardPost extends StatelessWidget {
  final String username;
  final String userImage;
  final String postText;
  final String postImage;
  //final RxBool isFollowing;
  // final RxBool isLiked;
  // final RxBool isDisLiked;
  //final VoidCallback? onFollow;
  // final VoidCallback? onLike;
  // final VoidCallback? onDisLike;

  const CustomCardPost({
    super.key,
    required this.username,
    required this.userImage,
    required this.postText,
    required this.postImage,
    //required this.isFollowing,
    // required this.isLiked,
    // required this.isDisLiked,
    //this.onFollow,
    // this.onLike,
    // this.onDisLike,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightGrey,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                    backgroundImage: Uri.tryParse(userImage)?.isAbsolute == true
                        ? NetworkImage(userImage)
                        : AssetImage(userImage),
                    radius: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    username,
                    style: Fonts.itim.copyWith(
                      color: AppColors.black,
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  // Obx(() {
                  //   if (isFollowing.value) {
                  //     return IconButton(
                  //       onPressed: onFollow,
                  //       icon: Icon(Icons.check_circle, color: AppColors.deepNavy, size: 35),
                  //     );
                  //   } else {
                  //     return ElevatedButton(
                  //       onPressed: onFollow,
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: AppColors.deepNavy,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  //       ),
                  //       child: Text(
                  //         "Follow",
                  //         style: Fonts.itim.copyWith(
                  //           color: AppColors.pureWhite,
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //     );
                  //   }
                  // }),
                ],
              ),
              SizedBox(height: 10),
              Text(
                postText,
                style: Fonts.itim.copyWith(
                  color: AppColors.black,
                  fontSize: 18,
                ),
                maxLines: null,
                overflow: TextOverflow.visible,
              ),
              SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Uri.tryParse(postImage)?.isAbsolute == true
                    ? Image.network(
                  postImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset(AppImages.noImage, fit: BoxFit.cover),
                )
                    : Image.asset(postImage, fit: BoxFit.cover),
              ),
              // SizedBox(height: 8),
              // Row(
              //   children: [
              //     Spacer(),
              //     Obx(() => IconButton(
              //       onPressed: onLike,
              //       icon: Icon(
              //         Icons.thumb_up,
              //         color: isLiked.value ? AppColors.lavender : AppColors.grey,
              //       ),
              //     )),
              //     Obx(() => IconButton(
              //       onPressed: onDisLike,
              //       icon: Icon(
              //         Icons.thumb_down,
              //         color: isDisLiked.value ? AppColors.lavender : AppColors.grey,
              //       ),
              //     )),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
