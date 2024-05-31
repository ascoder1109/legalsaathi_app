import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/screens/common/widgets/upload_relavent_documents.dart';

class FileCaseScreen extends StatelessWidget {
  const FileCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = _formatDate(now);
    String formattedTime = _formatTime(now);

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: kWhite,
        title: Text("File Case"),
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              const Text(
                "Date and Time:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: [
                  Text(
                    "Date: ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Time: ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    formattedTime,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Accused Name:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const TextField(
                decoration: InputDecoration(hintText: "Enter Accused Name"),
              ),
              const SizedBox(height: 20),
              const Text(
                "Short Description:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              ExpandableTextField(),
              const SizedBox(height: 20),
              const Text(
                "Upload Relevant Documents:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Center(
                child: UploadRelaventDocuments(),
              ),
              const SizedBox(height: 20),
              const Text(
                "Enter Location",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const TextField(
                decoration: InputDecoration(hintText: "Enter Location"),
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(kBlack),
                        foregroundColor: WidgetStateProperty.all(kWhite),
                      ),
                      child: Text("File Case"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  String _formatTime(DateTime dateTime) {
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String second = dateTime.second.toString().padLeft(2, '0');
    return "$hour:$minute:$second";
  }
}

class ExpandableTextField extends StatefulWidget {
  @override
  _ExpandableTextFieldState createState() => _ExpandableTextFieldState();
}

class _ExpandableTextFieldState extends State<ExpandableTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextField(
        controller: _controller,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration.collapsed(hintText: "Enter description"),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
