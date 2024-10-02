import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legalsaathi/routes.dart';
import 'package:legalsaathi/view/individual_dashboard_view.dart';
import 'package:legalsaathi/view/login_view.dart';
import 'package:legalsaathi/view/signup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.lawyerDashboard,
      routes: Routes.getRoutes(),
      // home: IndividualDashboardView(),
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 31, 35, 45))),
    );
  }
}
