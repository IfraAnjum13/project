import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/signup.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Define a list of image URLs for banners
  final List<String> bannerImages = [
    'https://marketplace.canva.com/EAFWecuevFk/1/0/1600w/canva-grey-brown-minimalist-summer-season-collections-banner-landscape-VXEmg9V800o.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/hd/ea996e45377079.5937175b5b421.jpg',
    'https://cdn.dribbble.com/users/4829229/screenshots/20005600/media/ad2a086fe3adc5ed3694f710509ba859.jpg?resize=400x300&vertical=center',
    'https://static.vecteezy.com/system/resources/previews/005/992/397/non_2x/electronics-store-that-sells-computers-tv-cellphones-and-buying-home-appliance-product-in-flat-background-illustration-for-poster-or-banner-vector.jpg',
    'https://img.freepik.com/free-vector/minimal-makeup-artist-youtube-thumbnail_23-2149378997.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glamify',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Add notification functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Add cart functionality here
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );
             },
            child: Text('Signup', style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Product Details'),
              onTap: () {
                // Navigate to product details page
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('User Profile'),
              onTap: () {
                // Navigate to user profile page
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                // Navigate to contact us page
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Order History'),
              onTap: () {
                // Navigate to order history page
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchBar(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CategoryChip(icon: Icons.shopping_bag, label: 'Fashion'),
                  CategoryChip(icon: Icons.devices, label: 'Electronics'),
                  CategoryChip(icon: Icons.kitchen, label: 'Appliances'),
                  CategoryChip(icon: Icons.face, label: 'Beauty'),CategoryChip(icon: Icons.emoji_objects, label: 'Fun'),
                  CategoryChip(icon: Icons.home, label: 'Home accessories'),
                ],
              ),
            ),

            SizedBox(height: 10),
            Container(
              height: 200, // Adjust the height according to your requirement
              child: BannerSliderWithDots(images: bannerImages),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Trending Now',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.blue[200],
                    child: Center(
                      child: Text('Trending Item $index'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryChip({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[200],
            radius: 30,
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class BannerSliderWithDots extends StatefulWidget {
  final List<String> images;

  BannerSliderWithDots({required this.images});

  @override
  _BannerSliderWithDotsState createState() => _BannerSliderWithDotsState();
}

class _BannerSliderWithDotsState extends State<BannerSliderWithDots> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            itemCount: widget.images.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return BannerImage(imageUrl: widget.images[index]);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.images.length,
                (index) => Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BannerImage extends StatelessWidget {
  final String imageUrl;

  const BannerImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 200, // Adjust the width according to your requirement
      color: Colors.grey, // You can set a placeholder color here
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}