import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/Fonts.dart';
import '../../../../../core/constants/colors.dart';

class CustomAvailableTimes extends StatelessWidget {
  final String day;
  final String startTime;
  final String endTime;
  final String callType;

  const CustomAvailableTimes({
    super.key,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.callType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: AppColors.whiteCard,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Container(
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.access_time,
            color: AppColors.purple,
            size: 35,
          ),
        ),
        title: Text(
          '$day \nFrom $startTime To $endTime',
          style: Fonts.itim.copyWith(color: AppColors.deepNavy,fontSize: 15),
        ),
        subtitle: Text(
          'Call Type: $callType',
          style: Fonts.itim.copyWith(color: AppColors.deepNavy,fontSize: 15),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: AppColors.deepNavy,size: 25,),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Delete pressed')),
            );
          },
        ),
      ),
    );
  }
}
