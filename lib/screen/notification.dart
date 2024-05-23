import 'package:flutter/material.dart';
class NotificationScreen extends StatelessWidget {
  //final Map<String, dynamic> orderDetails; // Define orderDetails variable

  //NotificationScreen({Key? key, required this.orderDetails}) : super(key: key); // Constructor to receive orderDetails

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          backgroundColor: Colors.pink,
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('Your order has been confirmed'),
              subtitle: Text('Tap to view details'),
              onTap: () {
                // Navigate to ConfirmationScreen when tapped on the notification

              },
            ),
          ],
        ),
      ),
    );
  }
}
