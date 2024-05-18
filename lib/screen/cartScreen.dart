import 'package:flutter/material.dart';
import 'package:project/screen/Checkout.dart';
import 'package:project/screen/bottom_navigate.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> _cartItems = [
    {"name": "Product 1", "price": 10, "quantity": 2},
    {"name": "Product 2", "price": 20, "quantity": 1},
    {"name": "Product 3", "price": 15, "quantity": 3},
    {"name": "Product 4", "price": 10, "quantity": 4},
    {"name": "Product 5", "price": 20, "quantity": 5},
    {"name": "Product 6", "price": 15, "quantity": 6},
    {"name": "Product 7", "price": 10, "quantity": 7},
    {"name": "Product 8", "price": 20, "quantity": 8},
    {"name": "Product 9", "price": 15, "quantity": 9},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: Colors.pink,
        ),
        body: Column(
          children: [
            Expanded(
              child: _buildCartList(),
            ),
            _buildTotalAmount(),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          onItemSelected: (index) {
            // Handle bottom navigation item tapped
          },
          currentIndex: 0, // Set the initial index
        ),
      ),
    );
  }

  Widget _buildCartList() {
    return ListView.builder(
      itemCount: _cartItems.length,
      itemBuilder: (context, index) {
        final item = _cartItems[index];
        return ListTile(
          title: Text(item['name']),
          subtitle: Text('Price: \$${item['price']}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (item['quantity'] > 1) {
                      item['quantity']--;
                    }
                  });
                },
              ),
              Text('${item['quantity']}'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    item['quantity']++;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTotalAmount() {
    double totalAmount = _calculateTotalPrice();
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutPage()),
              );
            },
            style: ElevatedButton.styleFrom(
            ),
            child: Text('Checkout'),
          ),
        ],
      ),
    );
  }

  double _calculateTotalPrice() {
    double totalPrice = 0;
    _cartItems.forEach((item) {
      totalPrice += (item['price'] * item['quantity']);
    });
    return totalPrice;
  }
}

void main() {
  runApp(MaterialApp(
    home: CartScreen(),
  ));
}
