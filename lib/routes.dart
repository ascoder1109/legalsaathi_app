import 'package:flutter/material.dart';
import 'package:legalsaathi/screens/auth/login_screen.dart';
import 'package:legalsaathi/screens/auth/signup_screen.dart';
import 'package:legalsaathi/screens/common/case_details_page.dart';
import 'package:legalsaathi/screens/individual/case_filed_screen.dart';
import 'package:legalsaathi/screens/individual/file_case_screen.dart';
import 'package:legalsaathi/screens/individual/individual_main_scaffold.dart';
import 'package:legalsaathi/screens/individual/individual_profile_screen.dart';
import 'package:legalsaathi/screens/individual/lawyer_screen_file_case.dart';
import 'package:legalsaathi/screens/individual/individual_currently_running_case.dart';
import 'package:legalsaathi/screens/lawyer/lawyer_main_scaffold.dart';
import 'package:legalsaathi/screens/common/user_profile_screen.dart';

class Routes {
  // static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String individualMainScaffold = '/individualMainScaffold';
  static const String toLawyerScreenFileCase = '/toLawyerScreenFileCase';
  static const String toCaseDetailsPage = '/toCaseDetailsPage';
  static const String toFileCaseScreen = '/toFileCaseScreen';
  static const String toCaseFiledDelayScreen = '/toCaseFiledDelayScreen';
  static const String toIndividualUserProfile = '/toIndividualProfileScreen';
  static const String toLawyerMainScaffold = '/toLawyerMainScaffold';
  static const String toUserProfileScreen = '/toUserProfileScreen';
  static const String toLawyerUserProfile = '/toLawyerUserProfile';
  static const String toIndividualCurrentlyRunningCase =
      '/toIndividualCurrentlyRunningCase';
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      signup: (context) => SignupScreen(),
      individualMainScaffold: (context) => IndividualMainScaffold(),
      toLawyerScreenFileCase: (context) => LawyerScreenFileCase(),
      toUserProfileScreen: (context) => UserProfileScreen(),
      // toIndividualUserProfile: (context) => IndividualProfileScreen(),
      toLawyerMainScaffold: (context) => LawyerMainScaffold(),
      // toLawyerUserProfile: (context) => LawyerProfileScreen(),
      toIndividualCurrentlyRunningCase: (context) =>
          IndividualCurrentlyRunningCase(),
      toCaseDetailsPage: (context) => CaseDetailsPage(),
      toFileCaseScreen: (context) => FileCaseScreen(),
      // toLawyerMainScaffold: (context) => F,
      toCaseFiledDelayScreen: (context) => CaseFiledScreen()
    };
  }
}
