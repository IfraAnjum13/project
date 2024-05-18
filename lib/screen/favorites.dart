import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // List of favorite products
  List<String> favoriteProducts = [
    'Product 1',
    'Product 2',
    'Product 3',
    // Add more favorite products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteProducts[index]),
            // Add functionality to view details of favorite product
            onTap: () {
              // Navigate to the details screen of the favorite product
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(productName: favoriteProducts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final String productName;

  const ProductDetailsScreen({Key? key, required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Text(
          'Details of $productName', // Display details of the selected product
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
