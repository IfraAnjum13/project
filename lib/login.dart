import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/signup.dart';
import 'package:project/screen/forgotPassword.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _login() {
    // Perform your login logic here
    bool loginSuccess = true; // Assuming login is successful for demonstration

    if (loginSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // Navigate to homepage
      );
    } else {
      // Handle login failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Glamify'),
          backgroundColor: Colors.pink, // Set app bar color
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20), // Add space between AppBar and heading
                    Text(
                      'Welcome to Glamify! Please login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20), // Add space between heading and fields
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off), // Change icon based on obscureText state
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _login, // Call login function when button is pressed
                      child: Text('Login'),
                    ),
                    SizedBox(height: 10), // Add some space between buttons
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        'Don\'t have an account? Sign up',
                        style: TextStyle(
                          color: Colors.pink,
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Add some space between buttons
                    ElevatedButton(
                      onPressed: () {
                        // Continue with Google functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Set background color to white
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset(
                            'assets/glogo.png', // Add path to Google logo image
                            height: 20,
                          ),
                          SizedBox(width: 10), // Add space between icon and text
                          Text(
                            'Continue with Google',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
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
