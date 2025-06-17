import 'dart:ui';                    // for ImageFilter
import 'package:flutter/material.dart';

class Event {
  final String title;
  final String imageUrl;
  // Todo pass all event info here
  Event({required this.title, required this.imageUrl});
}

class EventsCarousel extends StatefulWidget {
  final List<Event> events;
  final double height;
  const EventsCarousel({
    Key? key,
    required this.events,
    this.height = 220,
  }) : super(key: key);

  @override
  _EventsCarouselState createState() => _EventsCarouselState();
}

class _EventsCarouselState extends State<EventsCarousel> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    // viewportFraction < 1.0 shows parts of the side cards
    _pageController = PageController(viewportFraction: .7);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.events.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              }
              return Center(
                child: Transform.scale(
                  scale: value,
                  child: Opacity(
                    opacity: (value < 0.7) ? 0.7 : 1.0,
                    child: _EventCard(
                      event: widget.events[index],
                      blurred: value < 0.95,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _EventCard extends StatelessWidget {
  final Event event;
  final bool blurred;
  

  const _EventCard({
    Key? key,
    required this.event,
    this.blurred = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        fit: StackFit.expand,
        children: [
          //  Background image
          Image.network(
            event.imageUrl,
            fit: BoxFit.cover,
          ),

          //  Optional blur overlay on side cards
          if (blurred)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  color: Colors.black.withOpacity(0), // needed for BackdropFilter
                ),
              ),
            ),

          //  Text overlay at bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Text(
                event.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
