import 'package:flutter/material.dart';
import 'package:legalsaathi/view/case_view.dart';

class CaseCard extends StatelessWidget {
  final String caseTitle;
  final String caseId;
  final String caseStatus;
  final String lawyerName;
  final String lawyerContact;
  final String startDate;
  final String nextHearingDate;
  final String description;

  const CaseCard({
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

    return GestureDetector(
      onTap: () {
        // Navigate to CaseView page with case details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CaseView(
              caseTitle: caseTitle,
              caseId: caseId,
              caseStatus: caseStatus,
              lawyerName: lawyerName,
              lawyerContact: lawyerContact,
              startDate: startDate,
              nextHearingDate: nextHearingDate,
              description: description,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caseTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Case ID: $caseId",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      caseStatus,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: getStatusColor(),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 16,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
