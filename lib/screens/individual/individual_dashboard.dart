import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/screens/individual/widgets/currently_running_case.dart';
import 'package:legalsaathi/screens/individual/widgets/individual_bottom_navigation_bar.dart';
import 'package:legalsaathi/screens/individual/widgets/next_appearence_individual_card.dart';

class IndividualDashboard extends StatelessWidget {
  const IndividualDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            "Currently Running Case:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CurrentlyRunningCase(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            "Next Appearence:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: NextAppearenceIndividualCard(),
        )
      ],
    );
  }
}
