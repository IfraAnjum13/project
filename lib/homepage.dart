import 'package:flutter/material.dart';
import 'package:project/login.dart';
import 'package:project/signup.dart';
import 'package:project/screen/bottom_navigate.dart';
import 'package:project/screen/trending_now.dart';
import 'package:project/screen/banner_slider_with_dots.dart';
import 'package:project/screen/cartScreen.dart';
import 'package:project/screen/user_profile.dart'; // Import the user profile screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> bannerImages = [
    'https://marketplace.canva.com/EAFWecuevFk/1/0/1600w/canva-grey-brown-minimalist-summer-season-collections-banner-landscape-VXEmg9V800o.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/hd/ea996e45377079.5937175b5b421.jpg',
    'https://cdn.dribbble.com/users/4829229/screenshots/20005600/media/ad2a086fe3adc5ed3694f710509ba859.jpg?resize=400x300&vertical=center',
    'https://static.vecteezy.com/system/resources/previews/005/992/397/non_2x/electronics-store-that-sells-computers-tv-cellphones-and-buying-home-appliance-product-in-flat-background-illustration-for-poster-or-banner-vector.jpg',
    'https://img.freepik.com/free-vector/minimal-makeup-artist-youtube-thumbnail_23-2149378997.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Glamify',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.pink,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text(
                'Signup',
                style: TextStyle(color: Colors.black),
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
                  'DashBoard',
                  style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  color: Colors.pink,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfileScreen()),
                  );
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
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10), // Add space between AppBar and SearchBar
                      SearchBar(),
                      SizedBox(height: 20), // Add space between SearchBar and Categories
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
                            CategoryChip(icon: Icons.man, label: 'Men'),
                            CategoryChip(icon: Icons.woman, label: 'Women'),
                            CategoryChip(icon: Icons.child_care, label: 'Kids'),
                            CategoryChip(icon: Icons.face, label: 'Beauty'),
                          ],
                        ),
                      ),
                      BannerSliderWithDots(bannerImages: bannerImages), // Call the modified BannerSliderWithDots widget
                      TrendingNow(),
                    ],
                  ),
                ),
              ),
              // BottomNavBar(
              //   onItemSelected: (index) {
              //     // Handle bottom navigation item tapped
              //     if (index == 2) { // Assuming user profile is at index 2
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => MyAccountScreen(username: 'User',)),
              //       );
              //     } else {
              //       // Handle other navigation items
              //     }
              //   },
              //   currentIndex: 0, // Set the initial index
              // ),
            ],
          ),
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
            borderRadius: BorderRadius.circular(10),
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
            backgroundColor: Colors.pink[200],
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