import 'package:flutter/material.dart';
//import 'package:project/screen/description.dart';
import 'package:project/wear_item.dart';
import 'package:project/wear_item.dart';
class WomensWearScreen extends StatelessWidget {
  final List<WearItem> WearItems = [
    WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fsafgan28%2Fkids-fashion%2F&psig=AOvVaw2turdAB6uwZlZ7AeOlNPy-&ust=1716274410343000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCIjWvMzxnIYDFQAAAAAdAAAAABAd', name: 'shalwar Kamez', price: '\$50',rating: 4.0),
    WearItem(imageUrl: 'https://i.pinimg.com/474x/f9/d5/d5/f9d5d508b16f52506974be82303efebb.jpg', name: 'shalwar kamez', price: '\$60', rating:4.0),
    WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Felitekids.com.pk%2Fproduct%2Fshirt-pants-new-style-summer-and-winter-dress-for-girls%2F&psig=AOvVaw1wd3KKJMwqLT8dLCSjk1le&ust=1716274701451000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCKCXy9jynIYDFQAAAAAdAAAAABAE', name: 'pent_shirt', price: '\$70' ,rating:4.0, description:"Adorable pent shirt for babies: soft, stylish, and comfortable"),
    WearItem(imageUrl: 'https://www.google.com/imgres?q=kids%20clothes%20for%20%20boystshirts&imgurl=https%3A%2F%2Fzoodmall.com%2Fcdn-cgi%2Fimage%2Fw%3D500%2Cfit%3Dcontain%2Cf%3Dauto%2Fhttps%3A%2F%2Fimages2.zoodmall.com%2Fhttps%253A%2Fimg.joomcdn.net%2F334f7f8fd3867d081d866511385902b896b8cbce_original.jpeg&imgrefurl=https%3A%2F%2Fwww.zoodmall.com.lb%2Fen%2Fproduct%2F29200917%2Fchildren-cute-number-blocks-clothes-kids-summer-fashion-tshirt-baby-boys-cartoon-tshirts-toddler-girls-short-sleeve-casual-tops%2F&docid=hhcWhZC1i16KeM&tbnid=dVwncWCOrbaeFM&vet=12ahUKEwiJzqaO1JuGAxXo8QIHHc9EDxQQM3oECCkQAA..i&w=500&h=500&hcb=2&ved=2ahUKEwiJzqaO1JuGAxXo8QIHHc9EDxQQM3oECCkQAA', name: 'shirt', price: '\$80' , rating:4.0,description:"Cozy and cute baby T-shirts for all-day comfort."),
    WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fthetrendytoddlers.com%2Fpages%2Fbaby-boy-clothes&psig=AOvVaw1ZOzX2iOSa7Jh4lMoPic-_&ust=1716274914947000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLiE8LzznIYDFQAAAAAdAAAAABAE', name: 'toddlers', price: '\$90', rating:4.0,description:"Charming dresses for babies and toddlers: perfect for every occasion."),
    WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ubuy.com.pk%2Fen%2Fproduct%2F1SRYZT0-fashion-new-baby-kids-boys-suit-tops-shirt-waistcoat-tie-pants-formal-flower-boys-4pcs-outfits-clothes&psig=AOvVaw1ZOzX2iOSa7Jh4lMoPic-_&ust=1716274914947000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLiE8LzznIYDFQAAAAAdAAAAABAJ', name: 'baby boy suit', price: '\$100',  rating:4.0,description:"baby boy suits: stylish, comfortable, and perfect for any special event."),
    WearItem(imageUrl: 'https://mtjonline.com/cdn/shop/products/BKS9167-_1.jpg?v=1645531254', name: 'shlawar kamez', price: '\$110', rating:4.0,description:"Elegant shalwaar kameez for babies: tradition meets comfort in every stitch.""Adorable top and skirt sets for babies: stylish, comfy, and perfect for playtime."),
    WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.daraz.pk%2Fproducts%2Fmababy-kids-girls-skirt-set-long-sleeve-crew-neck-tops-with-elastic-waist-skirt-casual-daily-outfit-i345509989.html&psig=AOvVaw01t5A7aDyCGqCMT6EJbzNz&ust=1716275202786000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMCZ28L0nIYDFQAAAAAdAAAAABAE', name: 'Top Skirt', price: '\$120', rating:4.0,description:"Adorable top and skirt sets for babies: stylish, comfy, and perfect for playtime."),
    WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.charlesclass.co.uk%2Fboys-navy-shorts-suit-with-royal-blue-dickie-bow-leo.html&psig=AOvVaw0tVKsXS6WpAJnzTSnZvlmT&ust=1716275401554000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPiy3qL1nIYDFQAAAAAdAAAAABAE', name: 'causal dress', price: '\$130', rating:4.0,description:"Charming and comfy casual dresses for babies, perfect for everyday wear."),
    WearItem(imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.rajkumari.co%2Flisting%2Ftops-shirts&psig=AOvVaw0PP3AnvLvUSaNi_dDrGO-t&ust=1716275521808000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJiIhOT1nIYDFQAAAAAdAAAAABAE', name: ' shirt', price: '\$140', rating:4.0,description:"Soft and stylish baby shirts, perfect for everyday comfort."),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('men\'s Wear'),
          backgroundColor: Colors.pink,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
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
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          WearItems[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          WearItems[index].name,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          WearItems[index].price,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
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
    home: WomensWearScreen(),
  ));
}