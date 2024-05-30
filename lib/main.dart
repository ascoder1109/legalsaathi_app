import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/screens/auth/login_screen.dart';
import 'package:legalsaathi/screens/auth/signup_screen.dart';
import 'package:legalsaathi/screens/individual/individual_dashboard.dart';
import 'package:legalsaathi/screens/individual/individual_main_scaffold.dart';
import 'package:legalsaathi/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const IndividualMainScaffold(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: kBlack,
          ),
          useMaterial3: true),
    );
  }
}
