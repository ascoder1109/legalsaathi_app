import 'package:flutter/material.dart';

class CurrentlyRunningCasesView extends StatelessWidget {
  const CurrentlyRunningCasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currently Running Cases"),
      ),
    );
  }
}
