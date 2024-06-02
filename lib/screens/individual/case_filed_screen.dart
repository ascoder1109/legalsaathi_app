import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legalsaathi/colors.dart';
import 'package:legalsaathi/routes.dart';

class CaseFiledScreen extends StatelessWidget {
  const CaseFiledScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark));

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, Routes.individualMainScaffold);
    });

    return const Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Case Filed!",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 8,
            ),
            Text("Please wait for the response from the lawyer.",
                style: TextStyle(fontSize: 16)),
            SizedBox(
              height: 16,
            ),
            Text("You will be redirected to dashboard",
                style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
