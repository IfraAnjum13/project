import 'package:flutter/material.dart';

import 'about_us_screen.dart'; // Import About Us Screen

class ProfileScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // Set your app bar title here
        backgroundColor: Colors.blue, // Set the background color of the app bar to blue
      ),
      body: Container(
        color: Colors.white, // Set background color to white
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Profile Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), // Change text color to black for visibility
              ),
              SizedBox(height: 20),
              _buildProfileTextField('Name', nameController),
              SizedBox(height: 10),
              _buildProfileTextField('Email', emailController),
              SizedBox(height: 10),
              _buildProfileTextField('Phone', phoneController),
              SizedBox(height: 20),
              _buildSectionTitle('Account Management'),
              SizedBox(height: 10),
              _buildSectionText(
                'Manage your orders, addresses, and preferences from here.',
              ),
              SizedBox(height: 20),
              _buildAboutUsButton(context),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.blue), // Set text color to blue
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), // Change text color to black for visibility
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: Colors.black), // Change text color to black for visibility
    );
  }

  Widget _buildAboutUsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutUsScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.blue, // Set button color to blue
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          'About Us', // Keep button name as About Us
          style: TextStyle(
            fontSize: 18,
            color: Colors.white, // Set button text color to white
          ),
        ),
      ),
    );
  }
}
