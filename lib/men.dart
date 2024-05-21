// import 'package:flutter/material.dart';
// import 'package:project/screen/description.dart';
// import 'package:project/screen/wear_item.dart';
//
// class MensWearScreen extends StatelessWidget {
//   final List<WearItem> WearItems = [
//     WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2Fpakistani-mens-salwar-kameez-sale-online-m2749--730568370787064202%2F&psig=AOvVaw2yQGUTX4WFaW2GwYCYoOSn&ust=1716271576073000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOC86IPnnIYDFQAAAAAdAAAAABAQ', name: 'shalwar Kamez', price: 50,rating: 4.0 ,description: "Elegant and comfortable, our boys' Shalwar Kameez is perfect for any occasion."),
//     WearItem(imageUrl: 'https://mtjonline.com/cdn/shop/products/MKS-9031_06.jpg?v=1620026350', name: 'Kurta', price: 60, rating:4.0 ,description: "Stylish and versatile, our boys' kurta is ideal for both casual and festive wear."),
//     WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Ftruclothing.com%2Fproducts%2Fmens-hooded-thobe-hood-jubba-nehru-stand-collar-islamic-clothing-muslim-kaftan-robe-saudi-slim-regular-fit&psig=AOvVaw2gIFwxJ5ObSLcNAmlyAUld&ust=1716271971456000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOjgi8nonIYDFQAAAAAdAAAAABAE', name: 'Thobe', price: 70 ,rating:4.0),
//     WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fuomoattire.com%2Fproducts%2Fpresident-blue-color-waistcoat-for-men&psig=AOvVaw0G0MuOb-lQHRnG0R3xPuwf&ust=1716272045239000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCKDK5OjonIYDFQAAAAAdAAAAABAE', name: 'Waist Coat', price: 80 , rating:4.0),
//     WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2Fslim-fit-bespoke-prince-coat-pakistan-for-men--734016439290253402%2F&psig=AOvVaw1IqkCpdFZXX6s3wx3NvRTl&ust=1716272215475000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCKClwdnpnIYDFQAAAAAdAAAAABAh', name: 'Prince Coat', price: 900, rating:4.0),
//     WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.colorsoutlet.com%2Fproduct%2Fprince-coat-pc-309%2F&psig=AOvVaw1IqkCpdFZXX6s3wx3NvRTl&ust=1716272215475000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCKClwdnpnIYDFQAAAAAdAAAAABAJ', name: 'Prince coat', price: 1000,  rating:4.0),
//     WearItem(imageUrl: 'https://i.pinimg.com/236x/d8/06/b6/d806b6da2d137f8985b8b8ca9cffbe82.jpg', name: 'Pent Coat', price: 110, rating:4.0),
//     WearItem(imageUrl: 'https://cdn.klothtrend.com/imgbook/product/wc/20231011/16970270111514086523.webp', name: 'Party Wear', price: 120, rating:4.0),
//     WearItem(imageUrl: 'https://media.nihalfashions.com/media/catalog/product/cache/caa15edf98145413286703527de7b8dd/b/l/black-cotton-mens-kurta-pajama-nmk-6218.jpg', name: 'Cotton Kurta Pajama', price: 130, rating:4.0),
//     WearItem(imageUrl: 'https://play-lh.googleusercontent.com/qVyrD4mdmMnEysI_-FnUvE0APwIYnm_mb4gJopcAe6YeV_CQ__EgaOz7lkXof4vUWw=w526-h296-rw', name: 'Sherwani', price: 140, rating:4.0),
//     WearItem(imageUrl: 'https://i.pinimg.com/736x/fc/d4/db/fcd4dbbd9d3f6d34c2ab71abac5f06db.jpg', name: 'Dress for Groom', price: 150, rating:4.0 ),
//     WearItem(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx3iYTnRvORTfkYG-AfEPKHIYMitcM5Y6_bnmfgqKRMQ&s', name: 'Summer Collection', price: 160, rating:4.0),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('men\'s Wear'),
//           backgroundColor: Colors.pink,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//               childAspectRatio: 0.75,
//             ),
//             itemCount: WearItems.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ProductDescriptionScreen(product: WearItems[index]),
//                     ),
//                   );
//                 },
//                 child: Card(
//                   elevation: 5,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Image.network(
//                           WearItems[index].imageUrl,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           WearItems[index].name,
//                           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Text(
//                           '\$${wearItems[index].price}',
//                           style: TextStyle(fontSize: 14, color: Colors.grey),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: MensWearScreen(),
//   ));
// }