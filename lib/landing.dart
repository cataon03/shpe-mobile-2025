import 'package:flutter/material.dart';
import 'package:shpeucfmobile/event_card.dart';
import 'package:shpeucfmobile/widgets/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

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
            child: CustomButton(
              text: 'Profile Name',
              backgroundColor: const Color(0xFFF2AC02),
              textColor: const Color.fromARGB(255, 31, 62, 105),
              onPressed: () {
                print('Someone clicked yay!!!');
              },
            ),
          ),

          Positioned(
            top: 330,
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
        ],
      ),
    );
  }
}
