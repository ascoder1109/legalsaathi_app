import 'package:flutter/material.dart';
import 'package:legalsaathi/screens/lawyer/widgets/lawyer_schedule_card.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Column(
        children: [
          LawyerScheduleCard()
        ],
      ),
    );
  }
}
