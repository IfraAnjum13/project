import 'package:flutter/material.dart';

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

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blue,
      ),
      body: _buildCartList(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Total: \$${_calculateTotalPrice()}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement checkout functionality
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
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
