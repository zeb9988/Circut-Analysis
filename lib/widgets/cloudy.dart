import 'package:flutter/material.dart';

class ThinkingCloudDotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final Path path = Path();

    // Draw the thinking cloud shape.
    path.moveTo(size.width / 2, 0);
    path.cubicTo(size.width * 0.4, 0, size.width * 0.2, size.height * 0.2, 0,
        size.height * 0.5);
    path.cubicTo(size.width * 0.2, size.height * 0.8, size.width * 0.4,
        size.height, size.width / 2, size.height);
    path.cubicTo(size.width * 0.6, size.height, size.width * 0.8,
        size.height * 0.8, size.width, size.height * 0.5);
    path.cubicTo(size.width * 0.8, size.height * 0.2, size.width * 0.6, 0,
        size.width / 2, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
