import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/routes.dart';

import 'package:legalsaathi/services/firebase_auth_service.dart';
import 'package:svg_flutter/svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _userType = 'Individual';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final FirebaseAuthService _authService =
      FirebaseAuthService(); // Creating an instance of FirebaseAuthService

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
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
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      label: Text("Name"),
                      hintText: "Enter your name",
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
                    controller: passwordController,
                    obscureText: true,
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
                  TextField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text("Confirm Password"),
                      hintText: "Re-enter your password",
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User Type',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      RadioListTile<String>(
                        title: Text('Individual'),
                        value: 'Individual',
                        groupValue: _userType,
                        onChanged: (value) {
                          setState(() {
                            _userType = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: Text('Lawyer'),
                        value: 'Lawyer',
                        groupValue: _userType,
                        onChanged: (value) {
                          setState(() {
                            _userType = value!;
                          });
                        },
                      ),
                      // RadioListTile<String>(
                      //   title: Text('Judge'),
                      //   value: 'Judge',
                      //   groupValue: _userType,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       _userType = value!;
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          barrierDismissible: false,
                        );
                        // Call signUp method from FirebaseAuthService
                        final errorMessage = await _authService.signUp(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          accountType: _userType,
                        );
                        if (errorMessage == null) {
                          await FirebaseDatabase.instance
                              .ref()
                              .child('users')
                              .push()
                              .set({
                            'name': nameController.text,
                            'email': emailController.text,
                            'accountType': _userType,
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Sign Up Successful!"),
                            ),
                          );
                          // Signup successful, navigate to next screen
                          Navigator.popAndPushNamed(context, Routes.login);
                        } else {
                          // Signup failed, show an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(errorMessage),
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(kBlack),
                      ),
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
            // const SizedBox(
            //   height: 20,
            // ),
            // Center(
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.popAndPushNamed(
            //           context, Routes.individualMainScaffold);
            //     },
            //     child: const Text(
            //       "Skip",
            //       style: TextStyle(fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
