// import 'package:flutter/material.dart';
// import 'package:project/screen/description.dart';
// import 'package:project/screen/wear_item.dart';
// class beautyScreen extends StatelessWidget {
//   final List<WearItem> WearItems = [
//     WearItem(imageUrl: 'https://wbm.com.pk/public/uploads/all/3gdpvvKLhYmAvMtcfVQzeGZmMP3WUBJ5A68ULhIU.jpg', name: 'Age-Defying Skincare', price: 5000,rating: 4.0,description:"Age-defying skin care rejuvenates and revitalizes your complexion, reducing the appearance of fine lines and wrinkles."),
//     WearItem(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJek89p-mMI2IM7WUZmEi0AzkfgfjKhzSC6Y3SxhI9kCbSeimaZxwCUtqNtG5dwm2MIr0&usqp=CAU', name: 'Beauty Kit', price: 60, rating:4.0,description:"A comprehensive beauty kit offering essential tools and products for skincare, makeup, and grooming needs."),
//     WearItem(imageUrl: 'https://thejade.pk/cdn/shop/products/jade-mineral-sunscreen-helio-pro-spf50-395632.jpg?v=1696248572', name: 'SunsCream', price: 70 ,rating:4.0, description:"A protective sunblock that shields your skin from harmful UV rays."),
//     WearItem(imageUrl: 'https://imageskincare.com/cdn/shop/articles/VITAL_C_hydrating_facial_oil_PDP_R05-1200x1200-ca598d10-1588-4e7a-9f6c-2517c1064f2b.png?v=1684512626&width=2048', name: 'Moisturiser Cream', price: 80 , rating:4.0,description:"A hydrating moisturizer that replenishes and nourishes your skin."),
//     WearItem(imageUrl: 'https://lh3.googleusercontent.com/proxy/4GJ1ByFiFCnd5LS9zflITuAzNR97RZ6UTfi-vHsYaSl_iHYRowZ7Abp3xToVbRFjIfW745FYjj7WeZXAUcM3kaZS2bbBlvI_nukwhNgf09iXIPT9BCIKzXH_20XAOGAQrEwbBSfZlieMxSO0u8yD9kqREqfkDbpQhXgWcTE9YKWYPmyntYQdTSIW0Qj4DGa-l3AGKLwXqprzYRRDcy6TvN829FQqhn65M6PqdhXF4-B43DYhKxs', name: 'Scrub', price: 90, rating:4.0,description:"Scrub away the worries, reveal the glow within"),
//     WearItem(imageUrl: 'https://pk-live-21.slatic.net/kf/S3c4f2235a9304a9e9843752f6165847aV.jpg_750x400.jpg_.webp', name: 'Makeup Kit', price: 100,  rating:4.0,description:"A palette of endless possibilities for self-expression."),
//     WearItem(imageUrl: 'https://arshcosmetics.pk/wp-content/uploads/2023/10/Missrose-Makeup-Fixera-arshcosmetics.pk_.jpg', name: 'MakeUp fixer Spray', price: 110, rating:4.0,description:"Lock in your look with the final touch of makeup fixer, ensuring your beauty lasts all day."),
//     WearItem(imageUrl: 'https://glamstore.pk/cdn/shop/products/ff12f67866af163327aa983ee606df59.jpg?v=1615111946', name: 'Makeup Brushes', price: 120, rating:4.0,description:"Makeup brushes are essential tools for achieving precise and flawless makeup application."),
//
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
//     home: beautyScreen(),
//   ));
// }