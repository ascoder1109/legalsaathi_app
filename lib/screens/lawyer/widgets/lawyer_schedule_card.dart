import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';

class LawyerScheduleCard extends StatelessWidget {
  const LawyerScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(10.0), // Adjust as desired
        side: BorderSide(
            color: kBlackTransparent,
            width: 1), // Border width and color
      ),
      color: kWhite,
      elevation: 0,
      // margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Date: 2/06/2024", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 10),
                  ScheduleItem(
                    time: '09:00 AM',
                    title: 'Meeting with Client',
                    location: 'Office',
                  ),
                  ScheduleItem(
                    time: '02:00 PM',
                    title: 'Court Hearing',
                    location: 'Courtroom 3',
                  ),
                  ScheduleItem(
                    time: '04:30 PM',
                    title: 'Client Consultation',
                    location: 'Office',
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

class ScheduleItem extends StatelessWidget {
  final String time;
  final String title;
  final String location;

  const ScheduleItem({
    required this.time,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            time,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Location: $location',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
