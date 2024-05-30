import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/routes.dart';
import 'package:svg_flutter/svg.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign-Up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  const Text(
                    "Please Sign-Up to continue",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: SvgPicture.asset(
                "assets/images/judge.svg",
                width: 240,
                height: 240,
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      label: Text("Name"),
                      hintText: "Enter your name",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kGrey),
                        // borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBlack),
                        // borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      label: Text("Email"),
                      hintText: "Enter your email",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kGrey),
                        // borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBlack),
                        // borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "Enter your password",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kGrey),
                        // borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBlack),
                        // borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text("Confirm Password"),
                      hintText: "Re-enter your password",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kGrey),
                        // borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBlack),
                        // borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(kBlack)),
                      child: const Text(
                        "Sign-Up!",
                        style: TextStyle(color: kWhite),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, Routes.login);
                      },
                      child: const Text(
                        "Already have an account? Log In Here!",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(
                      context, Routes.individualMainScaffold);
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
