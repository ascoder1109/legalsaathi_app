import 'package:flutter/material.dart';

class CaseView extends StatelessWidget {
  final String caseTitle;
  final String caseId;
  final String caseStatus;
  final String lawyerName;
  final String lawyerContact;
  final String startDate;
  final String nextHearingDate;
  final String description;

  const CaseView({
    Key? key,
    required this.caseTitle,
    required this.caseId,
    required this.caseStatus,
    required this.lawyerName,
    required this.lawyerContact,
    required this.startDate,
    required this.nextHearingDate,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getStatusColor() {
      if (caseStatus == "Ongoing") {
        return Colors.green;
      } else if (caseStatus == "Closed") {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(caseTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Case Overview
                  Text(
                    "Case Overview",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text("Case ID: $caseId"),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Status: $caseStatus",
                        style: TextStyle(
                          color: getStatusColor(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Start Date: $startDate",
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  Text(
                    "Lawyer Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text("Lawyer: $lawyerName"),
                  Text("Contact: $lawyerContact"),
                  SizedBox(height: 16),

                  Text(
                    "Next Hearing",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text("Next Hearing Date: $nextHearingDate"),
                  SizedBox(height: 16),

                  // Case Description
                  Text(
                    "Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(description),
                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.schedule),
                        label: Text("Schedule Meeting"),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.payment),
                        label: Text("Make Payment"),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
