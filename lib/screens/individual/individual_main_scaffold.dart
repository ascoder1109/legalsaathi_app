import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/screens/common/popular_case_screen.dart';
import 'package:legalsaathi/screens/common/search_page.dart';
import 'package:legalsaathi/screens/individual/individual_dashboard.dart';
import 'package:legalsaathi/screens/individual/widgets/individual_bottom_navigation_bar.dart';

class IndividualMainScaffold extends StatefulWidget {
  const IndividualMainScaffold({Key? key}) : super(key: key);

  @override
  State<IndividualMainScaffold> createState() => _IndividualMainScaffoldState();
}

class _IndividualMainScaffoldState extends State<IndividualMainScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getSelectedWidget() {
    switch (_selectedIndex) {
      case 0:
        return IndividualDashboard();
      case 1:
        return SearchPage(); // Replace with your actual widget
      case 2:
        return PopularCaseScreen(); // Replace with your actual widget
      case 3:
        return PopularCaseScreen(); // Replace with your actual widget
      // Replace with your actual widget
      default:
        return IndividualDashboard();
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
            child: Image.asset(
              'assets/images/profile.png',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
      body: _getSelectedWidget(),
      bottomNavigationBar: IndividualBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
