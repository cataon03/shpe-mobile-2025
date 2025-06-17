import 'package:flutter/material.dart';
import 'package:shpeucfmobile/event_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shpeucfmobile/widgets/EventsCarousel.dart';
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 150,
            child:
            EventsCarousel(
              events: [ // TODO: Fetch all events from database than add them here
                Event(title: "Reyjays workshop on Java", imageUrl: 'https://cdn-clekk.nitrocdn.com/tkvYXMZryjYrSVhxKeFTeXElceKUYHeV/assets/images/optimized/rev-cc9e27e/litslink.com/wp-content/uploads/2020/11/what-is-java-image.png'),
                Event(title: "Resume Workshop by daniel!!", imageUrl: 'https://www.investopedia.com/thmb/wtzEam1DrS2U3VgqoweCRaXzJ8Q=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/resume.asp-FINAL-7d61bbc8181747698b3cbb0b2ed6833e.png'),
                Event(title: "Denices workshop on Angular", imageUrl: 'https://assets.toptal.io/images?url=https%3A%2F%2Fbs-uploads.toptal.io%2Fblackfish-uploads%2Fcomponents%2Fblog_post_page%2F4088025%2Fcover_image%2Fregular_1708x683%2Fcover-top-18-most-common-angularjs-developer-mistakes-2e83cf285fc1fba29ce743e85c26c757.png')

              ],
              height: 180,
            ),
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
            top: 410,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 160,
              child: Center(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  children: [
                    EventCard(
                      title: 'Reyjays workshop on Java',
                      time: 'Today at 2pm',
                      description: 'come leearn some java witth rayjay!!',
                      onTap:
                          () => showEventDialog(
                            context,
                            'Tech Talk',
                            'Today at 4pm',
                            'come learn some java witth reyjay!!',
                          ),
                    ),
                    EventCard(
                      title: 'Resume Workshop by daniel!!',
                      time: 'june 15 at 4pm',
                      description: 'get that resume in top shape!!!',
                      onTap:
                          () => showEventDialog(
                            context,
                            'Resume Workshop',
                            'june 15 at 4pm',
                            '',
                          ),
                    ),
                    EventCard(
                      title: 'Denices workshop on Angular',
                      time: 'Thursday at 7:30PM',
                      description: 'Come learn angular with SHPE!',
                      onTap:
                          () => showEventDialog(
                            context,
                            'Angular!!',
                            'Thursday at 7:30PM',
                            'Come learn angular with SHPE!',
                          ),
                    ),
                  ],
                ),
              ),
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
