import 'package:flutter/material.dart';
import 'package:legalsaathi/colors.dart';

class CaseDetailsPage extends StatelessWidget {
  const CaseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text("Case Details"),
        backgroundColor: kWhite,
      ),
      body: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent aliquet est sed enim consequat faucibus. Donec accumsan pellentesque posuere. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris nec sem consectetur, consequat leo sit amet, porta erat. Maecenas malesuada malesuada magna vitae pulvinar. Sed non lectus in magna ultricies consequat. Mauris sed leo efficitur lorem rutrum ornare finibus quis ipsum."),
    );
  }
}
