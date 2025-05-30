import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const double height = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF2AC02), // SHPE Yellow
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_iconAssets.length, (index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: currentIndex == index
                  ? Color(0xFFF1F3F7)
                  : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                _iconAssets[index],
                height: 30, 
                width: 30,
                color: currentIndex == index
                    ? Colors.black
                    : Colors.black.withOpacity(0.5),
              ),
            ),
          );
        }),
      ),
    );
  }

  static const List<String> _iconAssets = [
    'lib/images/Home.png',
    'lib/images/Pictures.png',
    'lib/images/Calendar.png',
    'lib/images/Qr.png',
    'lib/images/Leaderboard.png',
  ];
}
