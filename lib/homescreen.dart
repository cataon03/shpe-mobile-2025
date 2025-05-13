import 'package:flutter/material.dart';

class BackgroundImageScreen extends StatelessWidget {
  const BackgroundImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('lib/images/background.png', fit: BoxFit.cover),

          Positioned(
            top: 50,
            left: 20,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset('lib/images/SHPE_LogoU.png', width: 650),
            ),
          ),

          // Add other UI elements here
        ],
      ),
    );
  }
}
