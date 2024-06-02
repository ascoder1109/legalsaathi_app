import 'package:flutter/material.dart';

import '../../../colors.dart';

class LawyerNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const LawyerNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: "Dashboard"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle), label: "File Case"),
        BottomNavigationBarItem(
            icon: Icon(Icons.schedule), label: "Schedule"),
        BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined), label: "Popular Cases"),

      ],
      currentIndex: selectedIndex, // Set the initial selected index
      selectedItemColor: kBlack, // Set the overall selected item color
      unselectedItemColor: kGrey, // Set the overall unselected item color
      onTap: onItemTapped,
    );
  }
}