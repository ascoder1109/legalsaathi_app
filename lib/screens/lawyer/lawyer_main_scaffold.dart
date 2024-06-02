import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/routes.dart';
import 'package:legalsaathi/screens/individual/file_case_screen.dart';
import 'package:legalsaathi/screens/lawyer/lawyer_dashboard_screen.dart';
import 'package:legalsaathi/screens/lawyer/schedule_screen.dart';
import 'package:legalsaathi/screens/lawyer/widgets/lawyer_navigation_bar.dart';

import '../common/popular_case_screen.dart';
import '../common/search_page.dart';

class LawyerMainScaffold extends StatefulWidget {
  const LawyerMainScaffold({super.key});

  @override
  State<LawyerMainScaffold> createState() => _LawyerMainScaffoldState();
}

class _LawyerMainScaffoldState extends State<LawyerMainScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget _getSelectedWidget() {
    switch (_selectedIndex) {
      case 0:
        return LawyerDashboardScreen();
      case 1:
        return SearchPage(); // Replace with your actual widget
      case 2:
        return FileCaseScreen(); // Replace with your actual widget
      case 3:
        return ScheduleScreen(); // Replace with your actual widget
    // Replace with your actual widget
      default:
        return PopularCaseScreen();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        title: const Text(
          "LegalSaathi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          const Padding(
              padding: EdgeInsets.all(11.0), child: Icon(Icons.notifications)),
          const Padding(padding: EdgeInsets.all(11.0), child: Icon(Icons.chat)),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.toLawyerUserProfile);
              },
              child: Image.asset(
                'assets/images/profile.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
        ],
      ),
      body: _getSelectedWidget(),
      bottomNavigationBar: LawyerNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );

  }
}
