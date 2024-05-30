import 'package:flutter/material.dart';

class FilterChipWidget extends StatefulWidget {
  const FilterChipWidget({
    super.key,
  });

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  String locationLabel = "Location";
  String experienceLevelLabel = "Experience Level";
  String lawyerTypeLabel = "Lawyer Type";
  String ratingLabel = "Rating";

  void _showAlertDialog(
      BuildContext context, String label, ValueChanged<String> onSubmitted) {
    TextEditingController _textFieldController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(label),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Enter $label"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSubmitted(_textFieldController.text);
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showLawyerTypeDropdown(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          115, 200, 150, 100), // Adjust position as needed
      items: [
        PopupMenuItem<String>(
          value: 'Criminal lawyers',
          child: Text('Criminal lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Environmental lawyers',
          child: Text('Environmental lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Family lawyers',
          child: Text('Family lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Corporate lawyers',
          child: Text('Corporate lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Civil lawyers',
          child: Text('Civil lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Intellectual property lawyers',
          child: Text('Intellectual property lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Tax lawyers',
          child: Text('Tax lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Cyber lawyers',
          child: Text('Cyber lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Estate planning lawyers',
          child: Text('Estate planning lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Worker\'s compensation lawyers',
          child: Text('Worker\'s compensation lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Public interest lawyers',
          child: Text('Public interest lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Medical malpractice lawyers',
          child: Text('Medical malpractice lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Merger and acquisition lawyers',
          child: Text('Merger and acquisition lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Labour lawyers',
          child: Text('Labour lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Bankruptcy lawyers',
          child: Text('Bankruptcy lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Securities lawyers',
          child: Text('Securities lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Military lawyers',
          child: Text('Military lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Contract lawyers',
          child: Text('Contract lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Government lawyers',
          child: Text('Government lawyers'),
        ),
        PopupMenuItem<String>(
          value: 'Immigration lawyers',
          child: Text('Immigration lawyers'),
        ),
      ],
    ).then((value) {
      if (value != null) {
        setState(() {
          lawyerTypeLabel = value;
        });
      }
    });
  }

  void _showRatingDropdown(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
          500, 200, 150, 100), // Adjust position as needed
      items: [
        PopupMenuItem<String>(
          value: '1',
          child: Text('1'),
        ),
        PopupMenuItem<String>(
          value: '2',
          child: Text('2'),
        ),
        PopupMenuItem<String>(
          value: '3',
          child: Text('3'),
        ),
        PopupMenuItem<String>(
          value: '4',
          child: Text('4'),
        ),
        PopupMenuItem<String>(
          value: '5',
          child: Text('5'),
        ),
      ],
    ).then((value) {
      if (value != null) {
        setState(() {
          ratingLabel = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 8,
          ),
          _buildChip(context, locationLabel, (newLabel) {
            setState(() {
              locationLabel = newLabel;
            });
          }),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () => _showLawyerTypeDropdown(context),
            child: Chip(
              label: Text(lawyerTypeLabel),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () => _showRatingDropdown(context),
            child: Chip(
              label: Text(ratingLabel),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
      BuildContext context, String label, ValueChanged<String> onSubmitted) {
    return GestureDetector(
      onTap: () => _showAlertDialog(context, label, onSubmitted),
      child: Chip(
        label: Text(label),
      ),
    );
  }
}
