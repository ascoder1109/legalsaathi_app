import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/routes.dart';
import 'package:svg_flutter/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: kWhite,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const Text(
                "Please Sign-In to continue",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: SvgPicture.asset(
                  "assets/images/login.svg",
                  width: 240,
                  height: 240,
                ),
              ),
              const SizedBox(
                height: 64,
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kBlack)),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: kWhite),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, Routes.signup);
                  },
                  child: const Text(
                    "Don't have an account? Sign Up Here!",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
