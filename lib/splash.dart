import 'package:flutter/material.dart';
import 'dart:math';

// Routes
import 'access.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Access()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Random splash = Random();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/splash_${(splash.nextInt(3) + 1).toString()}.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
