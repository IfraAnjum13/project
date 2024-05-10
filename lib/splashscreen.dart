import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/homepage.dart'; // Import your homepage file

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add a delay of 3 seconds before navigating to the home page
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()), // Navigate to the home page
      );
    });

    return Scaffold(
      backgroundColor: Colors.white, // Change to your splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your logo or any other splash screen content here
            Image.asset('assets/logo.png'), // Change to your logo image path
          ],
        ),
      ),
    );
  }
}
