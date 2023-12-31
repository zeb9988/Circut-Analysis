import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  CustomButton({
    required this.label,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Set the button width
      height: 60, // Set the button height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0), // Rounded corners
        color: color,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF11998e).withOpacity(0.5), // Shadow color
            blurRadius: 10, // Shadow blur radius
            offset: const Offset(0, 5), // Shadow offset
          ),
        ],
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // Match the outer border
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18, // Font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
