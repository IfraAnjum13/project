import 'package:flutter/material.dart';
import 'package:project/screen/confirmOrder.dart';

class PaymentScreen extends StatefulWidget {
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String selectedAddress;

  PaymentScreen({
    required this.name,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.selectedAddress,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = 'Cash on Delivery';

  void _confirmOrder() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationScreen(
          name: widget.name,
          email: widget.email,
          address: widget.address,
          phoneNumber: widget.phoneNumber,
          selectedAddress: widget.selectedAddress,
          paymentMethod: _selectedPaymentMethod,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method'),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'Cash on Delivery',
                    child: Text('Cash on Delivery'),
                  ),
                  // You can add more payment methods here
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _confirmOrder,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Center(
                  child: Text('Confirm Order'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}