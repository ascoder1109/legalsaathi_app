import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/routes.dart';
import 'package:legalsaathi/screens/lawyer/widgets/lawyer_about_me_card.dart';

class LawyerScreenFileCase extends StatelessWidget {
  const LawyerScreenFileCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        title: Text("Lawyer Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),

          Center(
            child: CircleAvatar(
              child: SizedBox(
                  child: ClipOval(
                child: Image.asset(
                  "assets/images/placeholder.jpg",
                ),
              )),
              radius: 100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "Lawyer Singh",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(
                  "@lawyersingh11231ls",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Chip(label: Text("Criminal Lawyer"))
              ],
            ),
          ),
          // Text("About Me:")
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kBlack),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.toFileCaseScreen);
                    },
                    child: Text(
                      "File Case",
                      style: TextStyle(color: kWhite),
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Add some spacing between buttons
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Chat",
                      style: TextStyle(color: kBlack),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "   About Me:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LawyerAboutMeCard(),
          ),
          const Text(
            "   Notable Cases:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
