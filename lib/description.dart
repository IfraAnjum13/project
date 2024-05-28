import 'package:flutter/material.dart';
import 'package:project/wear_item.dart';

class ProductDescriptionScreen extends StatefulWidget {
  final WearItem product;

  ProductDescriptionScreen({required this.product});

  @override
  _ProductDescriptionScreenState createState() => _ProductDescriptionScreenState();
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
    // Implement add to cart functionality
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
              SizedBox(height: 16),
              Text(
                widget.product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                widget.product.price,
                style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              ),
              SizedBox(height: 16),
              Text(
                "Description:", // Assuming the description is already present in the WearItem object
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                widget.product.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Select Quantity:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: decreaseQuantity,
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: increaseQuantity,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: addToCart,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      child: Text('Add to Cart'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: buyNow,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                      child: Text('Buy Now'),
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

class ColorOption extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  ColorOption({
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? Colors.black : Colors.pink, width: 2.0),
        ),
        width: 30,
        height: 30,
      ),
    );
  }
}