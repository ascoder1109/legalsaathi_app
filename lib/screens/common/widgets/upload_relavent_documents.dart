import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:legalsaathi/colors.dart';

class UploadRelaventDocuments extends StatefulWidget {
  const UploadRelaventDocuments({super.key});

  @override
  State<UploadRelaventDocuments> createState() =>
      _UploadRelaventDocumentsState();
}

class _UploadRelaventDocumentsState extends State<UploadRelaventDocuments> {
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile>? _selectedFiles;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kWhite,
      elevation: 0,
      child: Column(
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(kBlack),
              foregroundColor: WidgetStateProperty.all(kWhite),
            ),
            onPressed: _selectFiles,
            child: const Text('Add Document'),
          ),
          if (_selectedFiles != null)
            Wrap(
              children: _selectedFiles!.map((file) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    File(file.path),
                    height: 100,
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Future<void> _selectFiles() async {
    final List<XFile>? selectedFiles = await _imagePicker.pickMultiImage();
    if (selectedFiles != null) {
      setState(() {
        _selectedFiles = selectedFiles;
      });
    }
  }
}
