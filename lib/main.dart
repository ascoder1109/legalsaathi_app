import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/screens/auth/login_screen.dart';
import 'package:legalsaathi/screens/auth/signup_screen.dart';
import 'package:legalsaathi/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupScreen(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: kBlack,
          ),
          useMaterial3: true),
    );
  }
}
