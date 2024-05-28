import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/screen/description.dart';
import 'package:project/screen/wear_item.dart';
class kidsWearScreen extends StatefulWidget {
  @override
  State<kidsWearScreen> createState() => _kidsWearScreenState();
}

class _kidsWearScreenState extends State<kidsWearScreen> {
  final List<WearItem> WearItems = [
 

  ];
 @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    try {
      Fluttertoast.showToast(
          msg: "Loading Products ...",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      final result = await FirebaseFirestore.instance.collection('kids').get();

      result.docs.forEach((doc) {
        WearItems.add(WearItem.fromMap(doc.data()));
      });
      setState(() {});
    } on Exception catch (e) {
      log(e.toString());
      Fluttertoast.showToast(
          msg: "Error Loading Products",
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kids\'s Wear',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
          backgroundColor: Colors.pink,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.55,
            ),
            itemCount: WearItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDescriptionScreen(product: WearItems[index]),
                    ),
                  );
                },
                child: Card(
                  color: Colors.amber,
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Expanded(
                  child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  WearItems[index].imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
              WearItems[index].name,
              style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '\$${WearItems[index].price}',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star, color: Colors.pink),
                            const SizedBox(width: 4),
                            Text(
                              WearItems[index].rating.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: kidsWearScreen(),
  ));
}