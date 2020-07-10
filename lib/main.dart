import 'package:flutter/material.dart';

// Routes
import 'splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/splash_1.png'), context);
    precacheImage(AssetImage('images/splash_2.png'), context);
    precacheImage(AssetImage('images/splash_3.png'), context);
    return MaterialApp(
      title: 'Osiris',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
