import 'package:flutter/material.dart';
import 'package:shpeucfmobile/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shpeucfmobile/widgets/custom_bottom_nav_bar.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('', style: TextStyle(color: Colors.white))),
    Center(child: Text('', style: TextStyle(color: Colors.white))),
    Center(child: Text('', style: TextStyle(color: Colors.white))),
    Center(child: Text('', style: TextStyle(color: Colors.white))),
    Center(child: Text('', style: TextStyle(color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
              child: ElevatedButton(
                onPressed: () {
                  print('Clicked!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF2AC02),
                  foregroundColor: Color.fromARGB(255, 31, 62, 105),
                  textStyle: const TextStyle(fontFamily: 'Poppins'),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Text('PROFILE'),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'lib/images/profile.jpg',
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Expanded(child: _pages[_selectedIndex]),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                  child: CustomBottomNavBar(
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
