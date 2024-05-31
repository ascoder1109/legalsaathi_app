import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/routes.dart';
import 'package:legalsaathi/screens/common/widgets/lawyer_card.dart';

class IndividualCurrentlyRunningCase extends StatelessWidget {
  const IndividualCurrentlyRunningCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text("Currently Running Case"),
        backgroundColor: kWhite,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Case Name and ID:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Adjust as desired
                  side: BorderSide(
                      color: kBlackTransparent,
                      width: 1), // Border width and color
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
                        Center(
                          child: const Text(
                            "Illegal Business in Venus More",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Case ID: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Spacer(),
                            const Text(
                              "#12312",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Plantiff: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Spacer(),
                            const Text(
                              "User Sharma",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Accused Details:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Adjust as desired
                  side: BorderSide(
                      color: kBlackTransparent,
                      width: 1), // Border width and color
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
                              "Accused Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Spacer(),
                            const Text(
                              "Accused Karmakar",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.toCaseDetailsPage);
                  },
                  child: const Text(
                    "View Case Details",
                    style: TextStyle(color: kWhite),
                  ),
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kBlack)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Plantiff Lawyer:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              LawyerCard(),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Defandant Lawyer:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              LawyerCard(),
              Text(
                "Progress:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Adjust as desired
                  side: BorderSide(
                      color: kBlackTransparent,
                      width: 1), // Border width and color
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
                        Center(
                          child: const Text(
                            "Court Trials",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
