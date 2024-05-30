import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:legalsaathi/colors.dart';

class CurrentlyRunningCase extends StatelessWidget {
  const CurrentlyRunningCase({super.key});

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
                    "Case ID: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  const Text(
                    "#12312",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Plantiff: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  const Text(
                    "User Sharma",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Process: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  const Text(
                    "Ongoing",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Current Phase: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  const Text(
                    "Court Trails",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Lawyer: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Spacer(),
                  const Text(
                    "Lawyer Singh",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "View Details",
                    style: TextStyle(color: kWhite),
                  ),
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kBlack)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
