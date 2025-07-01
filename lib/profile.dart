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
          Container(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'lib/images/ProfileBackground.jpeg',
                width: double.infinity,
                height: 340,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 70, top: 5),
            child: Image.asset(width: 150, height: 150, 'lib/images/SHPE2.png')
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20, top: 38),
            child: GestureDetector(
              onTap:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Landing()),
                );
              },
              child: Image.asset(width: 50, height: 50, 'lib/images/backbutton.png',),
            )
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 100),
            child: Image.asset(
              width: 200,
              height: 200,
              'lib/images/Profile2.png'
            )
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 270),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('username');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF2AC02),
                    textStyle: const TextStyle(fontFamily: 'Poppins'),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    fixedSize: Size(MediaQuery.sizeOf(context).width - 20, 50),
                  ),
                  child: Text(
                    'USERNAME',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                )
              ],
            )
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 200),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('notifications');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF2AC02),
                    textStyle: const TextStyle(fontFamily: 'Poppins'),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    fixedSize: Size(MediaQuery.sizeOf(context).width - 20, 50),
                  ),
                  child: Text(
                    'NOTIFICATIONS',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                )
              ],
            )
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 130),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('settings');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF2AC02),
                    textStyle: const TextStyle(fontFamily: 'Poppins'),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    fixedSize: Size(MediaQuery.sizeOf(context).width - 20, 50),
                  ),
                  child: Text(
                    'SETTINGS',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                )
              ],
            )
          ),

          //----------Navbar----------
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
