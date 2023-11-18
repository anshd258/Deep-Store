
import 'package:flutter/material.dart';

class ScannerBracketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double sh = size.height;
    double sw = size.width;
    double cornerRadius = sh * 0.15;

    Paint paint = Paint()
      ..color = const Color(0xFF437A93)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(cornerRadius, 0)
      ..cubicTo(0, 0, 0, 0, 0, cornerRadius) // top-left corner
      ..moveTo(0, sh - cornerRadius)
      ..cubicTo(0, sh, 0, sh, cornerRadius, sh); // bottom-left corner

    path.moveTo(sw - cornerRadius, sh);
    path.cubicTo(sw, sh, sw, sh, sw, sh - cornerRadius); // bottom-right corner

    path.moveTo(sw, cornerRadius);
    path.cubicTo(sw, 0, sw, 0, sw - cornerRadius, 0); // top-right corner

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ScannerBracketPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ScannerBracketPainter oldDelegate) => false;
}
