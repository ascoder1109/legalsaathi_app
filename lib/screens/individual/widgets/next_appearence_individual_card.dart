import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';

class NextAppearenceIndividualCard extends StatelessWidget {
  const NextAppearenceIndividualCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Adjust as desired
        side: BorderSide(
            color: kBlackTransparent, width: 1), // Border width and color
      ),
      elevation: 0,
      child: Container(
        color: kWhite,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Date: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Spacer(),
                  const Text(
                    "29-May-2024",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Time: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Spacer(),
                  const Text(
                    "11:00 am",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Location: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Spacer(),
                  const Text(
                    "Siliguri Court",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
