import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/homepage.dart';
import 'package:project/login.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Create your account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.pink,
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: SignUpForm(
                    onSignUpComplete: (userData) {
                      // Handle signup completion here
                      print('User signed up: $userData');
                      // You can navigate to another screen or perform any other action
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  final Function(Map<String, String>)
      onSignUpComplete; // Callback function to handle signup completion

  const SignUpForm({super.key, required this.onSignUpComplete});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _fullNameController,
          decoration: const InputDecoration(labelText: 'User Name'),
        ),
        const SizedBox(height: 20.0),
        TextFormField(
          controller: _passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        const SizedBox(height: 20.0),
        TextFormField(
          controller: _genderController,
          decoration: const InputDecoration(labelText: 'Gender'),
        ),
        const SizedBox(height: 20.0),
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 20.0),
        TextFormField(
          controller: _phoneNumberController,
          decoration: const InputDecoration(labelText: 'Phone Number'),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () async {
            // Get user input from the form
            String fullName = _fullNameController.text;
            String password = _passwordController.text;
            String gender = _genderController.text;
            String email = _emailController.text;
            String phoneNumber = _phoneNumberController.text;

            try {
              // Validate user input (you can add validation logic here)
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email,
                password: password,
              );
              // Package user input into a map

              Map<String, String> userData = {
                'fullName': fullName,
                'email': email,
                'gender': gender,
                'phoneNumber': phoneNumber,
              };

              await FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .set(userData);
              Navigator.of(context).pushReplacement(
                CupertinoPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            } catch (err) {
              log(err.toString());
            }
          },
          child: const Text('Sign Up'),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account? ',
              style: TextStyle(color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.pink,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Implement sign up with Google logic here
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/glogo.png', // Add path to Google logo image
                height: 20,
              ),
              const SizedBox(width: 10), // Add space between icon and text
              const Text(
                'Continue with Google',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
