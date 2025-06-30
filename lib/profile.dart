import 'package:flutter/material.dart';
import 'package:shpeucfmobile/landing.dart';
import 'package:shpeucfmobile/widgets/custom_bottom_nav_bar.dart';
import 'package:shpeucfmobile/widgets/custom_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoading = true;
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
            bottom: 600,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                width: 500,
                height: 510,
                'lib/images/ProfileBackground.jpeg',
              ),
            ),
          ),
          Positioned(
            left: 70,
            child: Image.asset(width: 150, height: 150, 'lib/images/SHPE2.png'),
          ),
          Positioned(
            top: 35,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const Landing()),
                );
              },
              child: Image.asset(
                width: 50,
                height: 50,
                'lib/images/backbutton.png',
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Image.asset(
              width: 200,
              height: 200,
              'lib/images/Profile2.png',
            ),
          ),
          Positioned(
            bottom: 270,
            left: 10,
            right: 10,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                print("username");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF2AC02),
                textStyle: const TextStyle(fontFamily: 'Poppins'),
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Text(
                      'USERNAME',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: 10,
            right: 10,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                print("notifications");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF2AC02),
                textStyle: const TextStyle(fontFamily: 'Poppins'),
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Text(
                      'NOTIFICATIONS',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 130,
            left: 10,
            right: 10,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                print("settings");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF2AC02),
                textStyle: const TextStyle(fontFamily: 'Poppins'),
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Text(
                      'SETTINGS',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
