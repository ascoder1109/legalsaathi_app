import 'package:flutter/material.dart';
import 'package:legalsaathi/routes.dart';
import 'package:legalsaathi/view/widgets/service_card.dart';

class LawyerDashboardView extends StatelessWidget {
  const LawyerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello Lawyer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Lawyer',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: Text('lawyer@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/lawyer_pic_1.jpeg'),
              ),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text('Manage Cases'),
              onTap: () {
                // Navigate to manage cases
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Schedule Meetings'),
              onTap: () {
                // Navigate to schedule meetings
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('Messages'),
              onTap: () {
                // Navigate to chat with clients
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                hintText: "Search Cases",
                elevation: WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Services for Lawyers:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            ServicesCard(
              options: [
                ServiceOption(
                  icon: Icons.assignment,
                  label: "Manage Cases",
                  onTap: () {
                    // Navigator.pushNamed(context, Routes.manageCases);
                  },
                ),
                ServiceOption(
                  icon: Icons.schedule,
                  label: "Schedule Meetings",
                  onTap: () {
                    // Navigate to meeting scheduler
                  },
                ),
                ServiceOption(
                  icon: Icons.message,
                  label: "Messages",
                  onTap: () {
                    // Navigate to messages
                  },
                ),
                ServiceOption(
                  icon: Icons.security,
                  label: "Legal Advice",
                  onTap: () {
                    // Provide legal advice
                  },
                ),
                ServiceOption(
                  icon: Icons.report,
                  label: "View Reports",
                  onTap: () {
                    // Navigate to view reports
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
