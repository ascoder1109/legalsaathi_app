import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/routes.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: kWhite,
      ),
      body: FutureBuilder(
        future: _getUserData(_auth.currentUser!.uid), // Get user data using UID
        builder: (context, AsyncSnapshot<Map<String, dynamic>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            Map<String, dynamic>? userData = snapshot.data;
            if (userData != null) {
              return SingleChildScrollView(
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
                            userData['name'] ?? 'N/A',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                          // Text(
                          //   userData['userName'] ?? 'N/A',
                          //   style: TextStyle(
                          //       fontSize: 16, fontWeight: FontWeight.bold),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          Chip(
                            label: Text(userData['accountType'] ?? 'N/A'),
                          ),
                          SizedBox(
                            height: 16,
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
                                onTap: () {
                                  _logout(context);
                                },
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
                                onTap: () {

                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Other ListTile widgets
                  ],
                ),
              );
            } else {
              return Center(child: Text('User data not found.'));
            }
          }
        },
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
