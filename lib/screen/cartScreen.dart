import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/screen/Checkout.dart'; // Import the CheckoutPage

class CartScreen extends StatefulWidget {
  static List<Map<String, dynamic>> cartItems = [];

  const CartScreen({Key? key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void removeFromCart(int index) {
    setState(() {
      CartScreen.cartItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item removed from cart')),
    );
  }

  void checkout() {
    // Navigate to the CheckoutPage
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const CheckoutPage()), // Navigate to CheckoutPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: CartScreen.cartItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                          CartScreen.cartItems[index]['imageUrl']),
                      title: Text(CartScreen.cartItems[index]['name']),
                      subtitle: Text(
                        '\$${CartScreen.cartItems[index]['price']} x ${CartScreen.cartItems[index]['quantity']}',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          removeFromCart(index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: CartScreen.cartItems.isEmpty
                    ? null
                    : FirebaseAuth.instance.currentUser == null
                        ? () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                content: const Text('Please Login to Checkout!'),
                                actions: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (ctx) => LoginScreen()),
                                      );
                                    },
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'No',
                                      style: TextStyle(color: Colors.pink),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        : checkout, style: ElevatedButton.styleFrom(backgroundColor: Colors.pink,
                ),
                child: const Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
