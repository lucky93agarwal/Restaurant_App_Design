import 'package:flutter/material.dart';

class CustomPainterTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();
    Path mainBackground = Path();

    // final center = Offset(50,50);
    // final radius = 150.0;
    // Paint paints = Paint();
    // paints.color = Colors.yellow;
    // paints.style = PaintingStyle.fill;
    // paints.strokeWidth = 4;
    // canvas.drawCircle(center, radius, paints);

    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = const Color(0xff2a0040);
    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    ovalPath.moveTo(0, height * 0.65);
    // ovalPath.quadraticBezierTo(width * 0.45, height * 0.25, width * 0.5, height * 0.5);

    ovalPath.quadraticBezierTo(width * 0.78, height * 0.7, width * 0.8, height);

    ovalPath.lineTo(0, height);

    ovalPath.close();

    paint.color =const Color(0x703B1975);
    canvas.drawPath(ovalPath, paint);



    Offset centers = Offset(width, 100);
    const radius = 180.0;
    Paint paints = Paint();
    paints.color = const Color(0x703B1975);
    paints.style = PaintingStyle.fill;
    paints.strokeWidth = 4;
    canvas.drawCircle(centers, radius, paints);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}