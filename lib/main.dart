import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/splashscreen.dart'; // Import your splashscreen file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hide the status bar
    //SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      home: SplashScreen(), // Display splash screen
    );
  }
}
