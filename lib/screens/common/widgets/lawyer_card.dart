import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/routes.dart';

class LawyerCard extends StatelessWidget {
  const LawyerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Adjust as desired
        side: BorderSide(
            color: kBlackTransparent, width: 1), // Border width and color
      ),
      color: kWhite,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/placeholder.jpg",
                          ),
                        )),
                    radius: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Lawyer Singh",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Criminal Lawyer",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Status: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "Open",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "4.5 ⭐",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.toLawyerScreenFileCase);
                            },
                            child: const Text(
                              "View Profile",
                              style: TextStyle(color: kWhite),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(kBlack)),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text(
                              "Chat",
                              style: TextStyle(color: kBlack),
                            ),
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(kWhite),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
