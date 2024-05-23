import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/homepage.dart';
import 'package:project/screen/cartScreen.dart';
import 'package:uuid/uuid.dart';

class ConfirmationScreen extends StatelessWidget {
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String selectedAddress;
  final String paymentMethod;
  double _subtotal = 0.0;
  final double _deliveryFee = 20.0;
  getOrderDetails() {
    for (var val in CartScreen.cartItems) {
      _subtotal += val['price'];
    }
  }

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
    getOrderDetails();
    List orderDetails = CartScreen.cartItems.map(
      (value) {
        return {
          'itemName': value['name'],
          'quantity': value['quantity'],
        };
      },
    ).toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Confirmation'),
          backgroundColor: Colors.pink,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Order Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Text('Name: $name'),
              // Text('Email: $email'),
              Text('Address: $address'),
              Text('Phone: $phoneNumber'),
              Text('Selected Address: $selectedAddress'),
              Text('Total: ${(_subtotal + _deliveryFee).toStringAsFixed(2)}'),
              Text('Payment Method: $paymentMethod'),
              const Text('Items:'),
              ...orderDetails.map((value) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(value['itemName']),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("x${value['quantity']}"),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Logic to complete the order, like API call or database operation

                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('orders')
                      .add({
                    'name': name.trim() == ''
                        ? FirebaseAuth.instance.currentUser!.email!
                            .split('@')[0]
                        : name,
                    'address': address,
                    'orderId': const Uuid().v1(),
                    'phone': phoneNumber,
                    'total': _subtotal + _deliveryFee,
                    'method': paymentMethod,
                    'orderDetails': orderDetails,
                    'orderDate':
                        DateFormat('EEEE, dd, yyyy').format(DateTime.now()),
                  }).then((_) {
                    CartScreen.cartItems = [];
                    Navigator.of(context).pushReplacement(
                        CupertinoPageRoute(builder: (context) => HomePage()));
                  });
                  print('Order completed');
                },
                style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Center(
                  child: Text('Complete Order',style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
