// Import the Flutter material design package
import 'package:flutter/material.dart';
import 'package:shpeucfmobile/homescreen.dart';
import 'package:shpeucfmobile/login.dart';
import 'package:shpeucfmobile/SignUp.dart';

// Entry point of the Flutter app
void main() {
  runApp(const MyApp());
}

// Define a stateless widget called MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Hides the debug banner in the top-right corner
      home: const HomeScreen(),
      routes: {
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
      }
    );
  }
}
