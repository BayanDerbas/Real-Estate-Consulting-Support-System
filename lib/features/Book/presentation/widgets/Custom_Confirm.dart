import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';

class CustomConfirm extends StatelessWidget {
  final String calltype;
  final String time;
  final String expertName;
  final String price;
  final String dateTime;
  final String sessionPrice;
  final String discountRate;
  final String finalPrice;

  const CustomConfirm({
    super.key,
    required this.calltype,
    required this.time,
    required this.expertName,
    required this.price,
    required this.dateTime,
    required this.sessionPrice,
    required this.discountRate,
    required this.finalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.softWhite,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color:AppColors.grey2, width: 1.4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.circle, size: 10, color: AppColors.purple),
                    const SizedBox(width: 8),
                    Text(
                      "تفاصيل الموعد :",
                      style: Fonts.itim.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                RichText(
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    style: Fonts.itim.copyWith(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                    children: [
                      const TextSpan(text: "لقد قمت بحجز جلسة "),
                      TextSpan(
                        text: calltype,
                        style: Fonts.itim.copyWith(color: AppColors.purple),
                      ),
                      const TextSpan(text: " بالصوت والصورة، مدتها "),
                      TextSpan(
                        text: time,
                        style: Fonts.itim.copyWith(color: AppColors.babySky),
                      ),
                      const TextSpan(text: " مع الخبير "),
                      TextSpan(
                        text: expertName,
                        style: Fonts.itim.copyWith(color: AppColors.babySky),
                      ),
                      const TextSpan(text: " بتاريخ "),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  dateTime,
                  style: Fonts.itim.copyWith(
                    fontSize: 14,
                    color: AppColors.purple,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "تكلفة الجلسة : \$$price",
                  style: Fonts.itim.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    fontSize: 18
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "كود الخصم",
              textAlign: TextAlign.right,
              style: Fonts.itim.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.softWhite,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(2, 2),
                  blurRadius: 8,
                ),

              ],
            ),
            child: TextField(
              textDirection: TextDirection.rtl,
              style: Fonts.itim.copyWith(color: Colors.black),
              decoration: InputDecoration(
                hintText: "ادخل الكود هنا",
                hintStyle: Fonts.itim.copyWith(color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildPriceRow("سعر الجلسة", "\$$sessionPrice"),
                  const SizedBox(height: 10),
                  _buildPriceRow("نسبة الخصم", "\$$discountRate"),
                  const Divider(height: 30, thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "السعر النهائي :",
                        style: Fonts.itim.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        "\$$finalPrice",
                        style: Fonts.itim.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),
          RichText(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Fonts.itim.copyWith(color: AppColors.black, fontSize: 15),
              children: [
                const TextSpan(text: "من خلال هذا الطلب فأنت توافق على الشروط وسياسة الخصوصية "),
                TextSpan(
                  text: "الشروط وسياسة الخصوصية",
                  style: Fonts.itim.copyWith(
                    color: AppColors.purple,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          print(".........................................");
                        },
                ),
              ],
            ),
          ).padding(EdgeInsets.symmetric(horizontal: 15)),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Fonts.itim.copyWith(fontSize: 15, color: Colors.black54),
        ),
        Text(
          value,
          style: Fonts.itim.copyWith(fontSize: 15, color: Colors.black87),
        ),
      ],
    );
  }
}
