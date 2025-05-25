import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';

class CustomScheduletime extends StatelessWidget {
  final List<String> selectedDays;
  final Function(String) onDayPressed;
  final Function(String) onDelete;

  const CustomScheduletime({
    super.key,
    required this.selectedDays,
    required this.onDayPressed,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "day",
            style: Fonts.itim.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.deepNavy,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildDayButton("Sat", selectedDays.contains("Sat")),
              _buildDayButton("Sun", selectedDays.contains("Sun")),
              _buildDayButton("Mon", selectedDays.contains("Mon")),
              _buildDayButton("Tue", selectedDays.contains("Tue")),
              _buildDayButton("Wed", selectedDays.contains("Wed")),
              _buildDayButton("Thu", selectedDays.contains("Thu")),
              _buildDayButton("Fri", selectedDays.contains("Fri")),
            ],
          ).scrollDirection(Axis.horizontal),
          const SizedBox(height: 20),
          Column(
            children: selectedDays.map((day) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.grey2,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          day,
                          style: Fonts.itim.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.deepNavy,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: AppColors.purple,
                            size: 24,
                          ),
                          onPressed: () => onDelete(day),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Start Time",
                        labelStyle: Fonts.itim.copyWith(
                          color: AppColors.grey,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.purple),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      style: Fonts.itim.copyWith(
                        color: AppColors.black,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "End Time",
                        labelStyle: Fonts.itim.copyWith(
                          color: AppColors.grey,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.purple),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      style: Fonts.itim.copyWith(
                        color: AppColors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDayButton(String day, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () => onDayPressed(day),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.lavender : AppColors.grey2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          day,
          style: Fonts.itim.copyWith(
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}