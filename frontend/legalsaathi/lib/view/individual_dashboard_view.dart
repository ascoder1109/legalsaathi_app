import 'package:flutter/material.dart';
import 'package:legalsaathi/routes.dart';
import 'package:legalsaathi/view/case_view.dart';
import 'package:legalsaathi/view/lawyer_profile_view.dart';
import 'package:legalsaathi/view/widgets/case_card.dart';
import 'package:legalsaathi/view/widgets/recommended_lawyer_card.dart';
import 'package:legalsaathi/view/widgets/service_card.dart';

class IndividualDashboardView extends StatelessWidget {
  const IndividualDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello User",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('User',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_pic.jpeg'),
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.archive),
              title: const Text('Archived Cases'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {},
            ),

            // Other drawer items...
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                hintText: "Search",
                elevation: WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "Currently Running Cases: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Icon(Icons.arrow_circle_right_sharp)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CaseCard(
                    caseTitle: "Case of John Doe",
                    caseId: "ID12345",
                    caseStatus: "Ongoing",
                    lawyerName: "John Lawyer",
                    lawyerContact: "123-456-7890",
                    startDate: "2024-01-10",
                    nextHearingDate: "2024-02-15",
                    description: "This is a detailed case description.",
                  ),
                  CaseCard(
                    caseTitle: "Case of Jane Smith",
                    caseId: "ID67890",
                    caseStatus: "Closed",
                    lawyerName: "Jane Lawyer",
                    lawyerContact: "098-765-4321",
                    startDate: "2023-09-15",
                    nextHearingDate: "N/A",
                    description: "This case has been closed.",
                  ),
                ],
              ),
            ),
            ServicesCard(
              options: [
                ServiceOption(
                  icon: Icons.balance,
                  label: "Search Court",
                  onTap: () {},
                ),
                ServiceOption(
                  icon: Icons.search,
                  label: "Search Lawyer",
                  onTap: () {},
                ),
                ServiceOption(
                  icon: Icons.assignment,
                  label: "Manage Case",
                  onTap: () {
                    Navigator.pushNamed(context, Routes.currentlyRunningCases);
                  },
                ),
                ServiceOption(
                  icon: Icons.payments,
                  label: "Make Payment",
                  onTap: () {},
                ),
                ServiceOption(
                  icon: Icons.schedule,
                  label: "Schedule Meeting",
                  onTap: () {},
                ),
                ServiceOption(
                  icon: Icons.report,
                  label: "View Reports",
                  onTap: () {},
                ),
                ServiceOption(
                  icon: Icons.message,
                  label: "Chat with Lawyer",
                  onTap: () {},
                ),
                ServiceOption(
                  icon: Icons.security,
                  label: "Legal Advice",
                  onTap: () {},
                ),
                ServiceOption(
                  icon: Icons.help,
                  label: "Support",
                  onTap: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "Recommended Lawyers: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RecommendedLawyerCard(
                    lawyerName: "John Doe",
                    lawyerType: "Criminal Lawyer",
                    isAvailable: true,
                    onBookNow: () {
                      // Handle booking for John Doe
                    },
                    onTap: () {
                      // Navigate to LawyerProfileView with details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LawyerProfileView(
                            lawyerName: "John Doe",
                            lawyerType: "Criminal Lawyer",
                            yearsOfExperience: 10,
                            summary:
                                "An experienced criminal lawyer specializing in high-profile cases.",
                            isAvailable: true,
                          ),
                        ),
                      );
                    },
                  ),
                  RecommendedLawyerCard(
                    lawyerName: "Jane Smith",
                    lawyerType: "Family Lawyer",
                    isAvailable: false,
                    onBookNow: () {
                      // Handle booking for Jane Smith
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LawyerProfileView(
                            lawyerName: "Jane Smith",
                            lawyerType: "Family Lawyer",
                            yearsOfExperience: 8,
                            summary:
                                "Specializes in family law, helping families resolve legal matters amicably.",
                            isAvailable: false,
                          ),
                        ),
                      );
                    },
                  ),
                  RecommendedLawyerCard(
                    lawyerName: "Emily Johnson",
                    lawyerType: "Corporate Lawyer",
                    isAvailable: true,
                    onBookNow: () {
                      // Handle booking for Emily Johnson
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LawyerProfileView(
                            lawyerName: "Emily Johnson",
                            lawyerType: "Corporate Lawyer",
                            yearsOfExperience: 12,
                            summary:
                                "Highly skilled in corporate law with extensive experience in large corporate cases.",
                            isAvailable: true,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
