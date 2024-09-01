import 'package:flutter/material.dart';

class YCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurvePoint = Offset(0, size.height - 20);
    final firstEndCurvePoint = Offset(30, size.height - 20);

    path.quadraticBezierTo(firstCurvePoint.dx, firstCurvePoint.dy,
        firstEndCurvePoint.dx, firstEndCurvePoint.dy);

    final secondCurvePoint = Offset(0, size.height - 20);
    final secondEndCurvePoint = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondCurvePoint.dx, secondCurvePoint.dy,
        secondEndCurvePoint.dx, secondEndCurvePoint.dy);

    final thirdCurvePoint = Offset(size.width, size.height - 20);
    final thirdEndCurvePoint = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdCurvePoint.dx, thirdCurvePoint.dy,
        thirdEndCurvePoint.dx, thirdEndCurvePoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
