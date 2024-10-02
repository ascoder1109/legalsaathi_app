import 'package:flutter/material.dart';
import 'package:legalsaathi/view/currently_running_cases_view.dart';
import 'package:legalsaathi/view/individual_dashboard_view.dart';
import 'package:legalsaathi/view/lawyer_dashboard_view.dart';
import 'package:legalsaathi/view/login_view.dart';
import 'package:legalsaathi/view/signup_view.dart';

class Routes {
  static const String signup = '/signup';
  static const String login = '/login';
  static const String individualDashboard = '/individualDashboard';
  static const String currentlyRunningCases = '/currentlyRunningCases';
  static const String lawyerDashboard = '/lawyerDashboard';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      signup: (context) => const SignupView(),
      login: (context) => const LoginView(),
      individualDashboard: (context) => IndividualDashboardView(),
      currentlyRunningCases: (context) => CurrentlyRunningCasesView(),
      lawyerDashboard: (context) => LawyerDashboardView()
    };
  }
}
