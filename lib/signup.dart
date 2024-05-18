import 'package:flutter/material.dart';
import 'package:project/login.dart';

void main() {
  runApp(SignUpScreen());
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Create your account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.pink,
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20.0),
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
  final Function(Map<String, String>) onSignUpComplete; // Callback function to handle signup completion

  SignUpForm({required this.onSignUpComplete});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _fullNameController,
          decoration: InputDecoration(labelText: 'User Name'),
        ),
        SizedBox(height: 20.0),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        SizedBox(height: 20.0),
        TextFormField(
          controller: _confirmPasswordController,
          decoration: InputDecoration(labelText: 'Confirm Password'),
          obscureText: true,
        ),
        SizedBox(height: 20.0),
        TextFormField(
          controller: _genderController,
          decoration: InputDecoration(labelText: 'Gender'),
        ),
        SizedBox(height: 20.0),
        TextFormField(
          controller: _phoneNumberController,
          decoration: InputDecoration(labelText: 'Phone Number'),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Get user input from the form
            String fullName = _fullNameController.text;
            String password = _passwordController.text;
            String confirmPassword = _confirmPasswordController.text;
            String gender = _genderController.text;
            String phoneNumber = _phoneNumberController.text;

            // Validate user input (you can add validation logic here)

            // Package user input into a map
            Map<String, String> userData = {
              'fullName': fullName,
              'password': password,
              'confirmPassword': confirmPassword,
              'gender': gender,
              'phoneNumber': phoneNumber,
            };

            // Call the callback function and pass user data
            widget.onSignUpComplete(userData);
          },
          child: Text('Sign Up'),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
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
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.pink,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
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
              SizedBox(width: 10), // Add space between icon and text
              Text(
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
