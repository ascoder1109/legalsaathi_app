import 'package:flutter/material.dart';

class RecommendedLawyerCard extends StatelessWidget {
  final String lawyerName;
  final String lawyerType;
  final bool isAvailable;
  final VoidCallback onBookNow;
  final VoidCallback onTap;

  const RecommendedLawyerCard({
    Key? key,
    required this.lawyerName,
    required this.lawyerType,
    required this.isAvailable,
    required this.onBookNow,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                    'assets/images/lawyer_pic_1.jpeg'), // Placeholder image
              ),
              SizedBox(height: 10),
              Text(
                lawyerName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                lawyerType,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 10),
              Text(
                isAvailable ? 'Available' : 'Not Available',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isAvailable ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: isAvailable ? onBookNow : null,
                child: Text("Book Now"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAvailable
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : Colors.grey,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
