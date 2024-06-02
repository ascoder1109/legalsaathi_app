import 'package:flutter/material.dart';
import 'package:legalsaathi/screens/individual/widgets/currently_running_case.dart';
import 'package:legalsaathi/screens/lawyer/widgets/lawyer_schedule_card.dart';

class LawyerDashboardScreen extends StatefulWidget {
  const LawyerDashboardScreen({super.key});

  @override
  State<LawyerDashboardScreen> createState() => _LawyerDashboardScreenState();
}

class _LawyerDashboardScreenState extends State<LawyerDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            "Currently Running Case:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CurrentlyRunningCase(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            "Your Schedule:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LawyerScheduleCard(),
        ),
      ],
    );
  }
}
