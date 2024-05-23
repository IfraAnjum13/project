import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/screen/forgotPassword.dart';
import 'package:project/signup.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _login() async {
    // Perform your login logic here
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: const Text('Successfully logged in')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()), // Navigate to homepage
      );
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('You are not signed up, please first sign up'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Glamify',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.pink,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20), // Add space between AppBar and avatar
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/lo.jpg'), // Replace with your avatar image asset
            ),
            const SizedBox(height: 20), // Add space between avatar and heading
            const Text(
              'Welcome to Glamify! Please login',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                        height: 20), // Add space between heading and fields
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: _obscureText,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons
                                  .visibility_off), // Change icon based on obscureText state
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen()),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                    ),
                      onPressed:
                          _login, // Call login function when button is pressed
                      child: const Text('Login'),
                    ),
                    const SizedBox(
                        height: 10), // Add some space between buttons
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: const Text(
                        'Don\'t have an account? Sign up',
                        style: TextStyle(
                          color: Colors.pink,
                        ),
                      ),
                    ),
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
