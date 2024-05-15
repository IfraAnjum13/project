import 'package:flutter/material.dart';
import 'package:project/homepage.dart'; // Import your homepage file
import 'package:project/signup.dart'; // Import your signup file
import 'package:project/login.dart'; // Import your login file

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/WI.jpg', // Add path to your welcome image
              height: 200,
              width: 400,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Our Store',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Please login or sign up to continue',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity, // Set the width to match the parent widget's width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text('Signup'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity, // Set the width to match the parent widget's width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('Login'),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
