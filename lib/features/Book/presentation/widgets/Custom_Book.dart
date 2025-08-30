import 'package:flutter/material.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';
import '../../../../core/constants/Fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_paths.dart';

class CustomBook extends StatelessWidget {
  final String image;
  final String name;
  final String job;
  final String rating;
  final String experience;
  final String successCount;
  final String followerNum;
  final List<DateTime> monthDays;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final String monthName;
  final VoidCallback? onNextMonth;
  final VoidCallback? onResetMonth;
  final bool showResetIcon;
  final List<int> sessionDuration;
  final String minute;
  final int selectedSessionIndex;
  final Function(int) onSessionSelected;
  final int selectedCallType;
  final Function(int) onCallTypeSelected;
  final List<String> appointmentHours;
  final int selectedHourIndex;
  final Function(int) onHourSelected;
  final List<bool> isBooked;
  final double? gridHeight;

  const CustomBook({
    super.key,
    required this.image,
    required this.name,
    required this.job,
    required this.rating,
    required this.experience,
    required this.successCount,
    required this.followerNum,
    required this.monthDays,
    required this.selectedDate,
    required this.onDateSelected,
    required this.monthName,
    required this.onNextMonth,
    this.onResetMonth,
    required this.showResetIcon,
    required this.sessionDuration,
    this.minute = "min",
    required this.selectedSessionIndex,
    required this.onSessionSelected,
    required this.selectedCallType,
    required this.onCallTypeSelected,
    required this.appointmentHours,
    required this.selectedHourIndex,
    required this.onHourSelected,
    required this.isBooked,
    required this.gridHeight,

  }) : assert(
  appointmentHours.length == isBooked.length,
  'appointmentHours and isBooked must have the same length',
  );
  ImageProvider _getImageProvider(String image) {
    try {
      if (image.startsWith("http")) {
        return NetworkImage(image);
      } else {
        return AssetImage(AppImages.noImage);
      }
    } catch (_) {
      return AssetImage(AppImages.expert);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: _getImageProvider(image),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            style: Fonts.itim.copyWith(
                              color: AppColors.black,
                              fontSize: 18,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppColors.grey2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            job,
                            style: Fonts.itim.copyWith(
                              color: AppColors.grey,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ).padding(const EdgeInsets.all(8)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.amber,
                          size: 25,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          rating,
                          style: Fonts.itim.copyWith(
                            color: AppColors.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "$experience سنوات من الخبرة",
                            style: Fonts.itim.copyWith(
                              color: AppColors.grey,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: AppColors.babySky,
                          size: 18,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            "$successCount تجربة ناجحة ",
                            style: Fonts.itim.copyWith(
                              color: AppColors.black,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          followerNum,
                          style: Fonts.itim.copyWith(
                            color: AppColors.purple,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "متابع",
                          style: Fonts.itim.copyWith(
                            color: AppColors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ).padding(const EdgeInsets.symmetric(horizontal: 16)),
        ),
        Divider(
          thickness: 1,
          color: AppColors.grey2,
        ).padding(const EdgeInsets.symmetric(vertical: 15)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Schedule",
                style: Fonts.itim.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.deepNavy,
                ),
              ),
              Row(
                children: [
                  if (showResetIcon)
                    GestureDetector(
                      onTap: onResetMonth,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  Text(monthName, style: Fonts.itim.copyWith(fontSize: 18,color: AppColors.black)),
                  GestureDetector(
                    onTap: onNextMonth,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: monthDays.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              final date = monthDays[index];
              final isSelected =
                  selectedDate.day == date.day &&
                      selectedDate.month == date.month;

              return GestureDetector(
                onTap: () => onDateSelected(date),
                child: Container(
                  width: 55,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.purple : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date.day.toString(),
                        style: Fonts.itim.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color:
                          isSelected
                              ? AppColors.pureWhite
                              : AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getWeekDayAbbreviation(date),
                        style: Fonts.itim.copyWith(
                          color:
                          isSelected ? AppColors.softWhite : AppColors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ).padding(const EdgeInsets.only(left: 3, right: 3, bottom: 5));
            },
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Session Duration",
          style: Fonts.itim.copyWith(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.deepNavy),
        ).padding(const EdgeInsets.symmetric(horizontal: 16.0)),
        const SizedBox(height: 5),
        SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            sessionDuration.map((duration) {
              final index = sessionDuration.indexOf(duration);
              final isSelected = selectedSessionIndex == index;
              return GestureDetector(
                onTap: () => onSessionSelected(index),
                child: Container(
                  width: 60,
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                    isSelected ? AppColors.purple : AppColors.softWhite,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "$duration",
                          style: Fonts.itim.copyWith(
                            fontSize: 16,
                            color:
                            isSelected
                                ? AppColors.pureWhite
                                : AppColors.black,
                          ),
                        ),
                        Text(
                          minute,
                          style: Fonts.itim.copyWith(
                            fontSize: 16,
                            color:
                            isSelected
                                ? AppColors.pureWhite
                                : AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Call Type",
          style: Fonts.itim.copyWith(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).padding(const EdgeInsets.symmetric(horizontal: 16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                selectedCallType == 1
                    ? AppColors.purple
                    : AppColors.softWhite,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () => onCallTypeSelected(1),
                icon: Icon(
                  Icons.call,
                  color:
                  selectedCallType == 1
                      ? AppColors.pureWhite
                      : AppColors.grey,
                  size: 35,
                ),
                splashRadius: 24,
              ),
            ),
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                selectedCallType == 2
                    ? AppColors.purple
                    : AppColors.softWhite,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () => onCallTypeSelected(2),
                icon: Icon(
                  Icons.videocam,
                  color:
                  selectedCallType == 2
                      ? AppColors.pureWhite
                      : AppColors.grey,
                  size: 35,
                ),
                splashRadius: 24,
              ),
            ),
          ],
        ),
        Text(
          "Appointment Hours",
          style: Fonts.itim.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ).padding(const EdgeInsets.only(left: 16, top: 13, bottom: 13)),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.6,
          ),
          itemCount: appointmentHours.length,
          itemBuilder: (context, index) {
            final hour = appointmentHours[index];
            final booked = isBooked[index];
            final isSelected = selectedHourIndex == index;

            Color bgColor;
            Color textColor;

            if (booked) {
              bgColor = AppColors.grey2;
              textColor = AppColors.grey;
            } else if (isSelected) {
              bgColor = AppColors.purple;
              textColor = AppColors.pureWhite;
            } else {
              bgColor = AppColors.softWhite;
              textColor = AppColors.black;
            }

            return IgnorePointer(
              ignoring: booked,
              child: GestureDetector(
                onTap: booked ? null : () => onHourSelected(index),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: booked
                        ? null
                        : const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      hour,
                      style: Fonts.itim.copyWith(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ),
            ).padding(const EdgeInsets.only(top: 10));
          },
        ),
      ],
    ).padding(const EdgeInsets.all(8));
  }
  String _getWeekDayAbbreviation(DateTime date) {
    const days = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];
    return days[date.weekday % 7];
  }
  List<DateTime> generateMonthDays(DateTime selectedDate) {
    final firstDay = DateTime(selectedDate.year, selectedDate.month, 1);
    final lastDay = DateTime(selectedDate.year, selectedDate.month + 1, 0);
    return List.generate(
      lastDay.day,
          (index) => DateTime(selectedDate.year, selectedDate.month, index + 1),
    );
  }
}