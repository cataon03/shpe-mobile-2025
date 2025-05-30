import 'package:flutter/material.dart';
import 'package:shpeucfmobile/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shpeucfmobile/screens/login.dart';
import 'package:shpeucfmobile/screens/SignUp.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        // Background image
        children: [
          Image.asset('lib/images/background.png', fit: BoxFit.cover),
      ]),
    );
    
  }
}