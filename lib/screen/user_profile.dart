import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/screen/banner_slider_with_dots.dart';
import 'package:project/signup.dart';
import 'package:project/welcome.dart';

class UserProfileScreen extends StatelessWidget {
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0), // Increased height
          child: AppBar(
            backgroundColor: Colors.pink,
            leading: IconButton(
              icon: const Icon(
                Icons.account_circle,
                size: 25,
              ), // User profile icon
              onPressed: () {
                debugPrint('User profile icon tapped');
              },
            ),
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: Text(
                      FirebaseAuth.instance.currentUser != null
                          ? FirebaseAuth.instance.currentUser!.email!
                              .split('@')[0]
                          : 'username',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (FirebaseAuth.instance.currentUser == null)
                      TextButton(
                        onPressed: () {
                          // Navigate to sign-up screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    PopupMenuButton<String>(
                      onSelected: (String result) async {
                        if (result == 'Logout') {
                          await FirebaseAuth.instance.signOut().then((_) {
                            Navigator.of(context).pushReplacement(
                              CupertinoPageRoute(
                                builder: (context) =>   WelcomeScreen(),
                              ),
                            );
                          });
                        }
                      },
                      icon: const Icon(Icons.settings, color: Colors.black),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'Logout',
                          child: Text('Logout'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Hello, Welcome to Glamify',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              BannerSliderWithDots(bannerImages: bannerImages),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Orders',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.payment),
                                Text('To Pay'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.receipt_long),
                                Text('To Receive'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(Icons.rate_review),
                                Text('To Review'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.cancel),
                                Text('My Cancellations'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
