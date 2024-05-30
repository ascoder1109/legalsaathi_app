import 'package:flutter/material.dart';
import 'package:legalsaathi/screens/auth/login_screen.dart';
import 'package:legalsaathi/screens/auth/signup_screen.dart';
import 'package:legalsaathi/screens/individual/individual_main_scaffold.dart';
import 'package:legalsaathi/screens/individual/lawyer_screen_file_case.dart';

class Routes {
  // static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String individualMainScaffold = '/individualMainScaffold';
  static const String toLawyerScreenFileCase = '/toLawyerScreenFileCase';
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      signup: (context) => SignupScreen(),
      individualMainScaffold: (context) => IndividualMainScaffold(),
      toLawyerScreenFileCase: (context) => LawyerScreenFileCase()
    };
  }
}
