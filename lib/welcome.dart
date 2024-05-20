import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/login.dart'; // Import your login file
import 'package:project/signup.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Set Scaffold background to transparent
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.pink, // Set the background color
              ),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        'assets/WI.jpg', // Add path to your welcome image
                        height: 200,
                        width: 200,
                        fit: BoxFit
                            .cover, // Make sure the image covers the circle properly
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome to Our Store',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please login or sign up to continue',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double
                          .infinity, // Set the width to match the parent widget's width
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                        child: const Text('Signup'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double
                          .infinity, // Set the width to match the parent widget's width
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: TextButton(
                onPressed: () {
                  // for (var i = 0; i < WearItems.length; i++) {
                  //   final uid = Uuid().v1();
                  //   final product = WearItems[i].toMap();
                  //   product['id'] = uid;
                  //   FirebaseFirestore.instance
                  //       .collection('products')
                  //       .doc(uid)
                  //       .set(product);
                  // }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Skip',
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.black),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
