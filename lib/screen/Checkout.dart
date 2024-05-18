import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkout App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: CheckoutPage(),
    );
  }
}

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
    // Logic to place the order
    // For example, you might navigate to a confirmation screen
    print('Order placed with details:');
    print('Name: $_name');
    print('Email: $_email');
    print('Address: $_address');
    print('Phone: $_phoneNumber');
    print('Selected Address: $_selectedAddress');
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
        body: SingleChildScrollView( // Wrap Scaffold with SingleChildScrollView
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
                SizedBox(height: 10), // Reduce space here
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
                SizedBox(height: 20), // Increase space here if needed
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
