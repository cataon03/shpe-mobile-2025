import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  // This is what I'm assuming we will use. But it will change after I talk to yousef
  final String title;
  final String time;
  final String description;
  final VoidCallback onTap;

  //  required for consistency
  const EventCard({
    super.key,
    required this.title,
    required this.time,
    required this.description,
    required this.onTap,
  });

  // screen tapping
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // so it looks good on mobile
        width: MediaQuery.of(context).size.width / 3 - 24,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 8, offset: Offset(2, 4)),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
