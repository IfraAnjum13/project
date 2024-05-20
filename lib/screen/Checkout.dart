import 'package:flutter/material.dart';
import 'package:project/screen/payment.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _selectedAddress = 'Home';
  int _subtotal = 36000;
  int _deliveryFee = 2000;

  // Variables to hold customer information
  String _name = '';
  String _email = '';
  String _address = '';
  String _phoneNumber = '';

  void _placeOrder() {
    // Navigate to the payment screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentScreen(
          name: _name,
          email: _email,
          address: _address,
          phoneNumber: _phoneNumber,
          selectedAddress: _selectedAddress,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int total = _subtotal + _deliveryFee;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Checkout'),
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customer Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    _name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    _email = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Address'),
                  onChanged: (value) {
                    _address = value;
                  },
                ),
                SizedBox(height: 10),
                DropdownButton<String>(
                  value: _selectedAddress,
                  onChanged: (value) {
                    setState(() {
                      _selectedAddress = value!;
                    });
                  },
                  items: [
                    DropdownMenuItem(value: 'Home', child: Text('Home')),
                    DropdownMenuItem(value: 'Office', child: Text('Office')),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  onChanged: (value) {
                    _phoneNumber = value;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Billing Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Delivery Fee: \$${_deliveryFee / 100}'),
                        Text('Subtotal: \$${_subtotal / 100}'),
                        Divider(),
                        Text('Total: \$${total / 100}'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _placeOrder,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Center(
                    child: Text('Place Order'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
