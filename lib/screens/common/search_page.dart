import 'package:flutter/material.dart';
import 'package:legalsaathi/screens/common/widgets/filter_chip_widget.dart';
import 'package:legalsaathi/screens/common/widgets/list_of_lawyers.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

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
          FilterChipWidget(),
          ListOfLawyers(),
        ],
      ),
    );
  }
}
