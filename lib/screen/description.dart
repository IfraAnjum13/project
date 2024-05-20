import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/screen/cartScreen.dart';
import 'package:project/screen/wear_item.dart';

class ProductDescriptionScreen extends StatefulWidget {
  final WearItem product;

  const ProductDescriptionScreen({super.key, required this.product});

  @override
  _ProductDescriptionScreenState createState() =>
      _ProductDescriptionScreenState();
}

class _ProductDescriptionScreenState extends State<ProductDescriptionScreen> {
  int quantity = 1;

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  void addToCart() {

    CartScreen.cartItems.add({
      "name": widget.product.name,
      "imageUrl": widget.product.imageUrl,
      "price": widget.product.price,
      "description": widget.product.description,
      "quantity": quantity,
    }); 
    Fluttertoast.showToast(msg: "✅ Item Added to Cart!");
  }

  void buyNow() {
    // Implement buy now functionality
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.product.imageUrl, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(
                widget.product.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${widget.product.price}',
                style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              ),
              const SizedBox(height: 16),
              const Text(
                "Description:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.product.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                "Select Quantity:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: decreaseQuantity,
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: increaseQuantity,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: addToCart,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      child: const Text('Add to Cart'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: buyNow,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink),
                      child: const Text('Buy Now'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
