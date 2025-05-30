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
        children: List.generate(_icons.length, (index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Icon(
              _icons[index],
              size: 30, 
              color: currentIndex == index
                  ? Colors.black
                  : Colors.black.withOpacity(0.5),
            ),
          );
        }),
      ),
    );
  }

  static const List<IconData> _icons = [
    Icons.home,
    Icons.image,
    Icons.calendar_today,
    Icons.camera_alt,
    Icons.groups,
  ];
}
