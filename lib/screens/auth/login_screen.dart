import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/routes.dart';
import 'package:legalsaathi/services/firebase_auth_service.dart';
import 'package:legalsaathi/screens/individual/individual_main_scaffold.dart';
import 'package:legalsaathi/screens/lawyer/lawyer_main_scaffold.dart';
import 'package:svg_flutter/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));

    final FirebaseAuthService _authService = FirebaseAuthService();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: "Enter your email",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kBlack),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  label: Text("Password"),
                  hintText: "Enter your password",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kBlack),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final errorMessage = await _authService.login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    if (errorMessage == null) {
                      // Retrieve account type after successful login
                      String? accountType = await _authService
                          .getAccountType(emailController.text);
                      if (accountType != null) {
                        // Navigate to appropriate screen based on account type
                        if (accountType == 'Individual') {
                          Navigator.pushNamedAndRemoveUntil(context,
                              Routes.individualMainScaffold, (route) => false);
                        } else if (accountType == 'Lawyer') {
                          Navigator.pushNamedAndRemoveUntil(context,
                              Routes.toLawyerMainScaffold, (route) => false);
                        }
                      } else {
                        // Account type not found, show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Account type not found.'),
                          ),
                        );
                      }
                    } else {
                      // Login failed, show an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(errorMessage),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kBlack),
                  ),
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
