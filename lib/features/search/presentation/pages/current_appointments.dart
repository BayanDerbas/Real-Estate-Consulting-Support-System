import 'package:flutter/cupertino.dart';
import 'package:graduation_project/core/constants/fake_data_not_for_use.dart';

import '../../../../core/constants/image_paths.dart';
import '../widgets/custom_appointment_card.dart';

class CurrentAppointments extends StatelessWidget {
  const CurrentAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fakeAppointments.length,
      itemBuilder: (context, index) {
        final appointment = fakeAppointments[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: CustomAppointmentCard(
            name: appointment['name'],
            date: appointment['date'],
            time: appointment['time'],
            image: appointment['image'],
            iconPath: appointment['iconPth'],
          ),
        );
      },
    );
  }
}
