import 'package:flutter/material.dart';

class TrendingNow extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'imageUrl': 'https://saleemfabrics.pk/cdn/shop/files/untitled4_720x_1b8aba23-88bc-44de-a5fd-2dd18742b431.jpg?v=1689249892',
      'description': '3 Piece Suit',
    },
    {
      'imageUrl': 'https://static-01.daraz.pk/p/43a9724a6530b95d2ec33d6c7b5d5fb1.png_750x750.jpg_.webp',
      'description': 'T-Shirt & Shorts',
    },
    {
      'imageUrl': 'https://static-01.daraz.pk/p/f1e807670f4b48d351503533223a2552.jpg_750x750.jpg_.webp',
      'description': 'Track Suit',
    },
    {
      'imageUrl': 'https://static-01.daraz.pk/p/668a61ab944afd2b7fe67af794044ec0.jpg',
      'description': 'Princess Short',
    },
  ];

  TrendingNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Trending Now', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return TrendingItem(
                imageUrl: item['imageUrl'],
                description: item['description'],
              );
            },
          ),
        ),
      ],
    );
  }
}

class TrendingItem extends StatelessWidget {
  final String imageUrl;
  final String description;

  const TrendingItem({
    super.key,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 5),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
