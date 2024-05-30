import 'package:flutter/material.dart';
import 'package:legalsaathi/screens/common/widgets/popular_cases_card.dart';

class PopularCaseScreen extends StatelessWidget {
  const PopularCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                ),
              ),
              hintText: "Search",
              elevation: WidgetStateProperty.all(0),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                PopularCasesCard(),
                PopularCasesCard(),
                PopularCasesCard(),
                PopularCasesCard(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
