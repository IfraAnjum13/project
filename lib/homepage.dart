import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/beauty.dart';
import 'package:project/login.dart';
import 'package:project/screen/banner_slider_with_dots.dart';
import 'package:project/screen/cartScreen.dart';
import 'package:project/screen/trending_now.dart';
import 'package:project/screen/user_profile.dart';
import 'package:project/signup.dart';
import 'package:project/women.dart';
import 'package:project/men.dart';
import 'package:project/kids.dart';
import 'package:project/footwear.dart';
import 'package:project/screen/notification.dart';
import 'package:project/screen/contactus.dart';

void main() async {
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
    'https://www.zilliondesigns.com/blog/wp-content/uploads/Perfect-Ecommerce-Sales-Banner.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Glamify', style: TextStyle(fontWeight: FontWeight.bold),),
          backgroundColor: Colors.pink,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationScreen()),

                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
            ),
            if (FirebaseAuth.instance.currentUser == null)
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: const Text(
                  'Signup',
                  style: TextStyle(color: Colors.black),
                ),
              ),
          ],
        ),
        drawer: Drawer(
    child: Container(
    color: Colors.pink,
    child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              if (FirebaseAuth.instance.currentUser == null)
                ListTile(
                  leading: const Icon(Icons.login),
                  title: const Text('Login'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ListTile(
                leading: const Icon(Icons.details),
                title: const Text('Product Details'),
                onTap: () {
                  // Navigate to product details page
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('User Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserProfileScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Contact Us'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => ContactUsScreen()),
                  );
                },
              ),

              //   },
              // ),
            ],
          ),)
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                    height: 10), // Add space between AppBar and SearchBar
                SearchBar(),
                const SizedBox(
                    height: 10), // Add space between SearchBar and Categories
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 150,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      const CategoryChip(icon: Icons.man, label: 'Men'),
                      const CategoryChip(icon: Icons.woman, label: 'Women'),
                      const CategoryChip(icon: Icons.child_care, label: 'Kids'),
                      const CategoryChip(icon: Icons.face, label: 'Beauty'),
                      const CategoryChip(icon: Icons.accessibility, label: 'FootWear')
                    ],
                  ),
                ),
                BannerSliderWithDots(
                    bannerImages:
                    bannerImages), // Call the modified BannerSliderWithDots widget
                TrendingNow(),
              ],
            ),
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
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
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
    return GestureDetector(
      onTap: () {
        if (label == 'Women') {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => WomensWearScreen()),
          );
        } else if (label == 'Men') {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => MensWearScreen()), // Navigate to MensWearScreen
          );
        }
        else if (label == 'Kids') {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => kidsWearScreen()), // Navigate to the Kids Wear Screen
          );
        }
        else if (label == 'Beauty') {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => beautyScreen()), // Navigate to the beauty Screen
          );
        }
        else if (label == 'Footwear') {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => FootwearScreen()),
          );
        }
        else {

        }
        // Add additional else if conditions for other categories if needed.
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
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
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
