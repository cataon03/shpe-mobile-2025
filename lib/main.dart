// Import the Flutter material design package
import 'package:flutter/material.dart';
import 'package:shpeucfmobile/homescreen.dart';

// Entry point of the Flutter app
void main() {
  runApp(const MyApp());
}

// Define a stateless widget called MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, // Hides the debug banner in the top-right corner
      home: HomeScreen(),
    );
  }
}
