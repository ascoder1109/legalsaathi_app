import 'package:flutter/material.dart';
import 'package:legalsaathi/screens/common/widgets/lawyer_card.dart';

class ListOfLawyers extends StatefulWidget {
  const ListOfLawyers({super.key});

  @override
  State<ListOfLawyers> createState() => _ListOfLawyersState();
}

class _ListOfLawyersState extends State<ListOfLawyers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          LawyerCard(),
          LawyerCard(),
          LawyerCard(),
          LawyerCard(),
        ],
      ),
    );
  }
}
