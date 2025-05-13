import 'package:flutter/material.dart';
import 'package:shpeucfmobile/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        // Background image
        children: [
          Image.asset('lib/images/background.png', fit: BoxFit.cover),
          // SHPE Logo
          Positioned(
            top: 10,
            left: 20,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset('lib/images/SHPE_Logo.svg', width: 450),
            ),
          ),
          // Login and Sign Up buttons
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Login  ',
                    backgroundColor: Color(0xFFF2AC02),
                    textColor: Color(0xFFF1F3F7),
                    // TODO: Go to login page
                    onPressed: () {
                      print('SHPE IS THE BEST!!!');
                    },
                  ),
                  const SizedBox(height: 19), // Spacing between buttons
                  CustomButton(
                    text: 'Sign Up',
                    backgroundColor: Color(0xFFF1F3F7),
                    textColor: Color(0xFFF2AC02),
                    // TODO: Go to Sign Up page
                    onPressed: () {
                      print('Go Knights Charge On!');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
