import 'package:flutter/material.dart';

class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 100)
      ..cubicTo(20, 120, 20, 80, 40, 100)
      ..cubicTo(60, 120, 60, 80, 80, 100)
      ..cubicTo(100, 140, 100, 95, 120, 100)
      ..cubicTo(140, 120, 140, 122, 160, 100)
      ..cubicTo(180, 80, 180, 95, 220, 100);

    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
