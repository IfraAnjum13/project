import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String selectedAddress;
  final String paymentMethod;

  ConfirmationScreen({
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.selectedAddress,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Confirmation'),
          backgroundColor: Colors.pink,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Name: $name'),
              Text('Email: $email'),
              Text('Address: $address'),
              Text('Phone: $phoneNumber'),
              Text('Selected Address: $selectedAddress'),
              Text('Payment Method: $paymentMethod'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Logic to complete the order, like API call or database operation
                  print('Order completed');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Center(
                  child: Text('Complete Order'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
