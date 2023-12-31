import 'package:flutter/material.dart';

Widget buildText(String text, double fontSize, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      overflow: TextOverflow.ellipsis,
      letterSpacing: 0.1, // Adjust the spacing between characters.
      // fontFamily: 'YourFontFamily', // Replace with your preferred font.
      shadows: const [
        Shadow(
          color: Colors.grey, // Add a subtle text shadow for better visibility.
          offset: Offset(1, 1),
          blurRadius: 2,
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );
}
