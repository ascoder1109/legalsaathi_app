import 'package:flutter/material.dart';
import 'package:legalsaathi/routes.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 80,
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LegalSaathi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text("  आपका कानूनी साथी",
                      style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(hintText: "Name"),
                    ),
                    TextField(
                      decoration: const InputDecoration(hintText: "Email"),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: "Phone number"),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: const InputDecoration(hintText: "Password"),
                    ),
                    TextField(
                      obscureText: true,
                      decoration:
                          const InputDecoration(hintText: "Confirm Password"),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Sign Up!"),
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.black),
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, Routes.login);
                      },
                      child: const Text(
                        "Already have an account? Tap here and Log-In!",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
