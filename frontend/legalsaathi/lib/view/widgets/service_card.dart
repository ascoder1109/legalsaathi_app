import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  final List<ServiceOption> options;

  const ServicesCard({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          physics:
              NeverScrollableScrollPhysics(), // Disable scrolling inside the card
          shrinkWrap: true, // Wrap the GridView to the available height
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3x3 grid
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1, // Keep items square
          ),
          itemCount: options.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: options[index].onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    options[index].icon,
                    size: 40,
                    color: Colors.black, // Customize icon color
                  ),
                  SizedBox(height: 8),
                  Text(
                    options[index].label,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ServiceOption {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ServiceOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}
