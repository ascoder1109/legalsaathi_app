import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';

import '../../routes.dart';

class IndividualProfileScreen extends StatelessWidget {
  const IndividualProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: kWhite,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                child: SizedBox(
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/profile.png",
                    ),
                  ),
                ),
                radius: 70,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    "User Sharma",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Chip(
                    label: Text("Individual Account"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit Profile'),
                  onTap: () {
                    // Handle 'Edit Profile' option
                  },
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text('Privacy Settings'),
                  onTap: () {
                    // Handle 'Privacy Settings' option
                  },
                ),
                ListTile(
                  leading: Icon(Icons.password),
                  title: Text('Change Password'),
                  onTap: () {
                    // Handle 'Change Password' option
                  },
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text('Notifications'),
                  onTap: () {
                    // Handle 'Notifications' option
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete Account'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help & Support'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text('Feedback'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Account Settings'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.currency_rupee),
                  title: Text('Subscription'),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
  Future<Map<String, dynamic>?> _getUserData(String uid) async {
    DataSnapshot? snapshot;
    try {
      final databaseReference = FirebaseDatabase.instance.ref().child('users').child(uid);
      await databaseReference.once().then((DatabaseEvent event) {
        if (event.snapshot != null) {
          snapshot = event.snapshot;
        }
      });

      if (snapshot != null && snapshot!.value != null) {
        // Check if snapshot value is Map<dynamic, dynamic>
        if (snapshot!.value is Map<dynamic, dynamic>) {
          // Cast snapshot value to Map<String, dynamic>
          Map<String, dynamic> userData = Map<String, dynamic>.from(snapshot!.value as Map<dynamic, dynamic>);
          return userData;
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
    return null;
  }
  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).popAndPushNamed(Routes.login);// Close the profile screen
      // You can navigate to the login screen or any other screen after logout
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Logged out successfully.'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print('Error logging out: $e');
      // Handle error if any
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error logging out. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
