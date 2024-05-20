import 'package:flutter/material.dart';
import 'package:project/screen/Checkout.dart';
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.pink,
      ),
      body: const Center(
        child: Text(
          'Proceed with your payment details here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  static List<Map<String, dynamic>> cartItems = [];

  const CartScreen({super.key});

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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CheckoutScreen()),
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
                      leading: Image.network(CartScreen.cartItems[index]['imageUrl']),
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
                onPressed: checkout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                child: const Text('Checkout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

