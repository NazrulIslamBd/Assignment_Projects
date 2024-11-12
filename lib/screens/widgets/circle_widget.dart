import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const CircleWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double circleSize = screenWidth * 0.35; // Responsive size for the circle
    double iconSize = screenWidth * 0.1; // Responsive icon size
    double fontSize = screenWidth * 0.04; // Responsive font size

    return Column(
      children: [
        SizedBox(
          height: circleSize,
          width: circleSize,
          child: CircleAvatar(
            backgroundColor: const Color(0xFFEADDFF),
            child: Icon(
              icon,
              color: const Color(0xFF21005D),
              size: iconSize,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.01), // Responsive vertical spacing
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1), // Responsive padding
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: screenHeight * 0.03), // Responsive vertical spacing
      ],
    );
  }
}
