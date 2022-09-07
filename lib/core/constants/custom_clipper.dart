import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0621143);
    path0.quadraticBezierTo(size.width * 0, size.height * 0.0139143, size.width * 0.1101176, size.height * 0);
    path0.quadraticBezierTo(size.width * 0.4785882, size.height * 0, size.width * 0.6014118, 0);
    path0.cubicTo(size.width * 0.7525294, size.height * 0.0046857, size.width * 0.6714118, size.height * 0.1138286, size.width * 0.7751176, size.height * 0.1136286);
    path0.cubicTo(size.width * 0.7525294, size.height * 0.1190857, size.width * 0.9979412, size.height * 0.0958571, size.width, size.height * 0.1685429);
    path0.quadraticBezierTo(size.width * 1.0102941, size.height * 0.2395714, size.width, size.height * 0.4554000);
    path0.quadraticBezierTo(size.width * 0.9514118, size.height * 0.4214000, size.width * 0.8661765, size.height * 0.4166571);
    path0.cubicTo(size.width * 0.6845882, size.height * 0.4166571, size.width * 0.3214118, size.height * 0.4166571, size.width * 0.1398235, size.height * 0.4166571);
    path0.quadraticBezierTo(size.width * 0.0098235, size.height * 0.4125714, 0, size.height * 0.3479714);
    path0.quadraticBezierTo(size.width * 0, size.height * 0.2986857, 0, size.height * 0.0621143);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
