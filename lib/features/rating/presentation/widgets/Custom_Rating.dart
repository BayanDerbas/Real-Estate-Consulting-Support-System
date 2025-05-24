import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';

class CustomRating extends StatelessWidget {
  final String image;
  final String name;
  final String job;
  final double rating;
  final ValueChanged<double> onRatingChanged;

  const CustomRating({
    super.key,
    required this.image,
    required this.name,
    required this.job,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Text(
          "هل كانت هذه الجلسة مفيدة ؟",
          style: Fonts.itim.copyWith(color: AppColors.lavender, fontSize: 24),
        ),
        SizedBox(height: 30),
        CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 100,
          backgroundColor: AppColors.deepNavy,
        ),
        SizedBox(height: 10),
        Text(
          name,
          style: Fonts.itim.copyWith(color: AppColors.black, fontSize: 22),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey2,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            job,
            style: Fonts.itim.copyWith(color: AppColors.grey, fontSize: 16),
          ).padding(EdgeInsets.all(10)),
        ),
        SizedBox(height: 10),
        // StarRating(
        //   size: 40.0,
        //   rating: rating,
        //   color: Colors.amber,
        //   borderColor: AppColors.grey2,
        //   starCount: 5,
        //   onRatingChanged: onRatingChanged
        // ),
        SizedBox(height: 10),
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          maxRating: 5,
          itemSize: 50,
          glow: false,
          allowHalfRating: false,
          itemBuilder: (context, _) => Icon(
            Icons.star_rate_rounded,
            color: Colors.amber.withOpacity(0.7),
          ),
          unratedColor: AppColors.grey2,
          onRatingUpdate: onRatingChanged,
        ),
        SizedBox(height: 15,),
      ],
    ).center();
  }
}
