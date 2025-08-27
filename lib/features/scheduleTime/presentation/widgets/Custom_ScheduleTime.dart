import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/widget_extension.dart';

class CustomScheduletime extends StatelessWidget {
  final List<String> selectedDays;
  final Function(String) onDayPressed;
  final Function(String) onDelete;
  final Map<String, RxList<ScheduleTimeSlot>> timeSlots;
  final Function(String) onAddSlot;
  final Function(String, int) onRemoveSlot;
  final Function(String, int, String) onCallTypeChanged;
  final TextStyle dayTextStyle;
  final TextStyle labelTextStyle;

  const CustomScheduletime({
    super.key,
    required this.selectedDays,
    required this.onDayPressed,
    required this.onDelete,
    required this.timeSlots,
    required this.onAddSlot,
    required this.onRemoveSlot,
    required this.onCallTypeChanged,
    required this.dayTextStyle,
    required this.labelTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildDayButton("Sat"),
            _buildDayButton("Sun"),
            _buildDayButton("Mon"),
            _buildDayButton("Tue"),
            _buildDayButton("Wed"),
            _buildDayButton("Thu"),
            _buildDayButton("Fri"),
          ],
        ).scrollDirection(Axis.horizontal),
        const SizedBox(height: 20),
        Column(
          children: selectedDays.map((day) {
            return Obx(() {
              final slots = timeSlots[day] ?? <ScheduleTimeSlot>[].obs;
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.grey2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(day, style: dayTextStyle),
                        IconButton(
                          icon: const Icon(Icons.delete, color: AppColors.purple),
                          onPressed: () => onDelete(day),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...slots.asMap().entries.map((entry) {
                            int index = entry.key;
                            ScheduleTimeSlot slot = entry.value;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 120,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppColors.pureWhite,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: slot.startController,
                                      decoration: InputDecoration(
                                        labelText: "start time",
                                        labelStyle:
                                        labelTextStyle.copyWith(fontSize: 14),
                                      ),
                                      style:
                                      labelTextStyle.copyWith(fontSize: 14),
                                    ),
                                    TextField(
                                      controller: slot.endController,
                                      decoration: InputDecoration(
                                        labelText: "end time",
                                        labelStyle:
                                        labelTextStyle.copyWith(fontSize: 14),
                                      ),
                                      style:
                                      labelTextStyle.copyWith(fontSize: 14),
                                    ),
                                    const SizedBox(height: 5),
                                    DropdownButtonFormField<String>(
                                      value: slot.callType,
                                      decoration: InputDecoration(
                                        labelStyle: labelTextStyle.copyWith(
                                            fontSize: 12),
                                      ),
                                      style: labelTextStyle.copyWith(fontSize: 14),
                                      items: const [
                                        DropdownMenuItem(
                                            value: "AUDIO", child: Text("AUDIO")),
                                        DropdownMenuItem(
                                            value: "VIDEO", child: Text("VIDEO")),
                                        DropdownMenuItem(
                                            value: "BOTH", child: Text("BOTH")),
                                      ],
                                      onChanged: (value) => onCallTypeChanged(
                                          day, index, value ?? "AUDIO"),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.delete,
                                            size: 18, color: Colors.red),
                                        onPressed: () => onRemoveSlot(day, index),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          IconButton(
                            icon: const Icon(Icons.add_circle,
                                color: AppColors.green, size: 32),
                            onPressed: () => onAddSlot(day),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDayButton(String day) {
    final isSelected = selectedDays.contains(day);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () => onDayPressed(day),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.lavender : AppColors.grey2,
        ),
        child: Text(day, style: dayTextStyle),
      ),
    );
  }
}

class ScheduleTimeSlot {
  TextEditingController startController;
  TextEditingController endController;
  String callType;

  ScheduleTimeSlot({
    required this.startController,
    required this.endController,
    this.callType = "AUDIO",
  });
}