import 'package:flutter/material.dart';
import 'package:flutter_todo_app_ui/screens/login_screen.dart';
import 'dart:math' as math;
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: ShapePainter(),
        child: Center(
          child: Container(),
        ),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Offset center = Offset(size.width / 2, size.height / 2);
    //Offset endingPoint = Offset(size.width, size.height / 2);
    // var path = Path();
    //path.moveTo(0, size.height / 2);
    //path.lineTo(size.width, size.height / 2);
    var path = Path();
    path.addOval(Rect.fromLTWH(50, size.height / 4, math.pi * 100, size.width));
    path.quadraticBezierTo(100, 0, math.pi, size.width / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
