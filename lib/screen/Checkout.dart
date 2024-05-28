import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/screen/cartScreen.dart';
import 'package:project/screen/payment.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _selectedAddress = 'Home';
  double _subtotal = 0.0;
  final double _deliveryFee = 20.0;
  getOrderDetails() {
    for (var val in CartScreen.cartItems) {
      _subtotal += val['price'];
    }
  }

  // Variables to hold customer information
  String _name = '';
  final String _email = '';
  String _address = '';
  String _phoneNumber = '';

  void _placeOrder() {
    // Navigate to the payment screen
    if (_address.trim() != '' && _phoneNumber.trim() != '') {
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
    }else{
       Fluttertoast.showToast(
          msg: "Must provide address & phone number!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    getOrderDetails();
    double total = _subtotal + _deliveryFee;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Checkout',
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),

          ),
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Customer Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,color: Colors.white
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    _name = value;
                  },
                ),
                // TextField(
                //   decoration: InputDecoration(labelText: 'Email'),
                //   onChanged: (value) {
                //     _email = value;
                //   },
                // ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Address'),
                  onChanged: (value) {
                    _address = value;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButton<String>(
                  value: _selectedAddress,
                  onChanged: (value) {
                    setState(() {
                      _selectedAddress = value!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: 'Home', child: Text('Home')),
                    DropdownMenuItem(value: 'Office', child: Text('Office')),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  onChanged: (value) {
                    _phoneNumber = value;
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Billing Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Delivery Fee: \$${_deliveryFee.toStringAsFixed(2)}'),
                        Text('Subtotal: \$${_subtotal.toStringAsFixed(2)}'),
                        const Divider(),
                        Text('Total: \$${total.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _placeOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Center(
                    child: Text('Place Order',style: TextStyle(color: Colors.white),),

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
