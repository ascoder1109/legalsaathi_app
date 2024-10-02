import 'package:flutter/material.dart';

class LawyerProfileView extends StatelessWidget {
  final String lawyerName;
  final String lawyerType;
  final int yearsOfExperience;
  final String summary;
  final bool isAvailable;

  const LawyerProfileView({
    Key? key,
    required this.lawyerName,
    required this.lawyerType,
    required this.yearsOfExperience,
    required this.summary,
    required this.isAvailable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lawyerName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/lawyer_pic_1.jpeg'),
              ),
            ),
            SizedBox(height: 20),

            // Lawyer Name
            Center(
              child: Text(
                lawyerName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 8),

            // Lawyer Type
            Center(
              child: Text(
                lawyerType,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Experience
            Text(
              "Years of Experience: $yearsOfExperience years",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // Summary
            Text(
              "Summary",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              summary,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            Spacer(),

            // Book Now Button
            Center(
              child: ElevatedButton(
                onPressed: isAvailable
                    ? () {
                        // Handle booking logic
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: isAvailable
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : Colors.grey,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text(isAvailable ? "Book Now" : "Unavailable"),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
