import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shpeucfmobile/landing.dart';
import 'package:shpeucfmobile/services/supabase_service.dart';
import 'package:shpeucfmobile/widgets/custom_bottom_nav_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  /*List<Map<String, dynamic>> curUser = [
    {
      //'userId': 'user1234',
      //'firstname': 'first',
      //'lastname': 'middle last',
      //'created_at': 'Spring 2025',
      //'points': '0',
      //'events_attended': '0',
      //'leaderboard_position': '0',
    },
  ];
  bool isLoading = true;*/
  int _selectedIndex = 0;
  /*late final SupabaseService _service;

  @override
  void initState() {
    super.initState();
    _service = SupabaseService();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final supabase = Supabase.instance.client;
    try {
      final user = supabase.auth.currentUser;

      print('here');

      final userId = user?.id;

      print('here2');
      final userInfo = await supabase
          .from('users')
          .select('firstname, lastname, points')
          .eq('id', userId)
          .limit(1);

      print('hi');

      final users = await supabase
          .from('users')
          .select('id, points')
          .order('points, ascending: false');

      final index = users.indexWhere((u) => u['id'] == userId);
      final leaderboardPosition = index >= 0 ? index + 1 : -1;

      print('hi2');

      userInfo['leaderboard_postion'] = leaderboardPosition.toString();
      userInfo['userId'] = userId;

      setState(() {
        curUser = List<Map<String, dynamic>>.from(userInfo);
        curUser = [userInfo];
        isLoading = false;
        print('curUser = $curUser');
      });
    } catch (error) {
      print('Error fetching users: $error');
      setState(() => isLoading = false);
    }
  }*/

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
          /*if (!isLoading && curUser.isNotEmpty)
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.05), //make more circular
                child: SvgPicture.network(
                  _service.getAvatarUrl('firstname, lastname'),
                  height: 200,
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          //spot for username, name, date started
          if (!isLoading && curUser.isNotEmpty)
            Positioned(
              top: 350,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(curUser.length, (index) {
                  final user = curUser[index];

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          user['userId'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Adumu',
                            fontSize: 27,
                          ),
                        ),
                        Text(
                          user['firstname'].toString() +
                              ' ' +
                              user['lastname'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          user['created_at'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          //spot for points, leaderboard position, and events attended
          if (!isLoading && curUser.isNotEmpty)
            Positioned(
                top: 470,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        children: [
                          Text(
                            curUser[0]['points'].toString(),
                            style: const TextStyle(
                              color: Color(0xFFF2AC02),
                              fontFamily: 'Adumu',
                              fontSize: 50,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'POINTS',
                            style: const TextStyle(
                              color: Color(0xFFF2AC02),
                              fontFamily: 'Poppins',
                              fontSize: 15,
                            ),
                          ),
                        ],
                    ),
                    SizedBox(width: 50,),
                    Column(
                        children: [
                          Text(
                            curUser[0]['leaderboard_position'].toString(),
                            style: const TextStyle(
                              color: Color(0xFFF2AC02),
                              fontFamily: 'Adumu',
                              fontSize: 50,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'LEADERBOARD',
                            style: const TextStyle(
                              color: Color(0xFFF2AC02),
                              fontFamily: 'Poppins',
                              fontSize: 15,
                            ),
                          ),
                        ],
                    ),
                    SizedBox(width: 50,),
                    Column(
                        children: [
                          Text(
                            curUser[0]['events'].toString(),
                            style: const TextStyle(
                              color: Color(0xFFF2AC02),
                              fontFamily: 'Adumu',
                              fontSize: 50,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'EVENTS',
                            style: const TextStyle(
                              color: Color(0xFFF2AC02),
                              fontFamily: 'Poppins',
                              fontSize: 15,
                            ),
                          ),
                        ],
                    ),
                  ],
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
          ),*/
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
