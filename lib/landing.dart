import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shpeucfmobile/screens/login.dart';
import 'package:shpeucfmobile/models/event.dart';
import 'package:shpeucfmobile/widgets/events_carousel.dart';
import 'package:shpeucfmobile/widgets/custom_bottom_nav_bar.dart';
import 'package:shpeucfmobile/services/supabase_service.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _selectedIndex = 0;
  late final SupabaseService _service;
  late final Future<List<Event>> _eventsFuture;

  @override
  void initState() {
    super.initState();
    _service = SupabaseService();
    _eventsFuture = supabaseService.fetchEvents();
    
  }

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

  void showEventDialog(
    BuildContext context,
    String title,
    String time,
    String description,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Time: $time'),
                const SizedBox(height: 8),
                Text(description),
              ],
            ),
            actions: [
              TextButton(
                child: const Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sampleEvents = List.generate(
      5,
      (i) => Event(
        id: '$i',
        name: 'Event $i',
        imageUrl: 'https://picsum.photos/seed/$i/600/400',
      ),
    );
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
                  Center(child: Text('PROFILE')),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ClipOval(
                      child: Image.asset(
                        'lib/images/profile.jpg',
                        width: 70,
                        height: 75,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // -----------EVENTS AREA
          Positioned(
            bottom: 330,
            height: 200,
            left: 0,
            right: 0,
            child: FutureBuilder<List<Event>>(
              future: _eventsFuture,
              builder: (context,snap){
                if(snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snap.hasError) {
                  return Center(child: Text('Error: ${snap.error}'));
                }
                final events = snap.data ?? [];
                if (events.isEmpty) {
                  return const Center(child: Text('no events yet'),);
                }
                return EventsCarousel(events: events);
              }
              )

            
          ),
          
          Positioned(
            top: 330,
            left: 0,
            right: 0,
            child: Image.asset(
              'lib/images/leaderboardWord.png', //replace with events image
              width: 100,
              height: 75,
              fit: BoxFit.contain,
            ),
          ),
          
          Positioned(
            bottom: 265,
            left: 0,
            right: 0,
            child: Image.asset(
              'lib/images/leaderboardWord.png',
              width: 100,
              height: 75,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 190,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6.0,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'lib/images/topOfLeaderboard.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
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
