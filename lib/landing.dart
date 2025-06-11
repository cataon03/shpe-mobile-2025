import 'package:flutter/material.dart';
import 'package:shpeucfmobile/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: [
          Image.asset('lib/images/background.png', fit: BoxFit.cover),

          Positioned(
            top: 75,
            left: 30,
            right: 30,
            child: Align( 
              alignment: Alignment.topCenter,
              child: SvgPicture.asset('lib/images/SHPE_Logo.svg', width: 150),
            ),
          ),

          Positioned(
            top: 240,
            left: 30,
            right: 30,
            child: CustomButton(
              text: 'Profile Name',
              backgroundColor: Color(0xFFF2AC02),
              textColor: Color.fromARGB(255, 31, 62, 105),
              onPressed: () {
                print('Clicked!');
              },
            ),
          ),
        ],
      ),
    );
  }
}
