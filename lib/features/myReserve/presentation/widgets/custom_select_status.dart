import 'package:flutter/material.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';

class CustomSelectStatus extends StatelessWidget {
  final List<String> statuses;
  final String selectedStatus;
  final ValueChanged<String> onStatusSelected;

  const CustomSelectStatus({
    super.key,
    required this.statuses,
    required this.selectedStatus,
    required this.onStatusSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: statuses.map((status) {
              final isSelected = selectedStatus == status;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GestureDetector(
                  onTap: () => onStatusSelected(status),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.purple.withOpacity(0.1) : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: Fonts.itim.copyWith(
                        color: isSelected ? AppColors.purple : AppColors.deepNavy,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
