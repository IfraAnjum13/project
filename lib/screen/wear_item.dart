// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// wear_item.dart
class WearItem {
  final String id;
  final String imageUrl;
  final String name;
  final double price;
  final double rating;
  final String description;

  WearItem(
      {required this.imageUrl,
      required this.id,
      required this.name,
      required this.price,
      required this.rating,
      required this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'rating': rating,
      'description': description,
    };
  }

  factory WearItem.fromMap(Map<String, dynamic> map) {
    return WearItem(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
      rating: map['rating'] as double,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WearItem.fromJson(String source) =>
      WearItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
