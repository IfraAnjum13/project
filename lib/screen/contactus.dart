import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Text(
                    'Contact Information:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('123 Main Street, Faisalabad'),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text('+1234567890'),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('ifra1320@gmail.com'),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: Text('Send us a message:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    ),

                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Message',
                  ),
                  maxLines: 5,
                ),
                SizedBox(height: 20),
                ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                  onPressed: () {
                    // Handle send message action
                  },
                  child: Text('Send',style: TextStyle(color: Colors.white),
                ),
                ),],
            ),
          ),
        ),
      ),
    ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ContactUsScreen(),
  ));
}
