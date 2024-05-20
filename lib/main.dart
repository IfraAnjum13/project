import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCUpwBLT3HqYJN30zhGnfS7H4fRg7l-0r8",
        authDomain: "myapp-cd36a.firebaseapp.com",
        projectId: "myapp-cd36a",
        storageBucket: "myapp-cd36a.appspot.com",
        messagingSenderId: "452203101828",
        appId: "1:452203101828:web:2c38d68c600a85bb4c8cd1",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Hide the status bar
    //SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      home: SplashScreen(), // Display splash screen
    );
  }
}
