import 'package:app/presentation/features/events/widgets/event_card.dart';
import 'package:app/presentation/features/events/widgets/event_grid_card.dart';
import 'package:app/presentation/widgets/custom_appbar.dart';
import 'package:app/presentation/widgets/theme_button.dart';
import 'package:flutter/material.dart';

class Event {
  final String name;
  final String description;
  final String url;
  final String imageUrl;

  Event({
    required this.name,
    required this.description,
    required this.url,
    required this.imageUrl,
  });
}

class EventsScreen extends StatelessWidget {
  static const route = '/events';

  const EventsScreen({super.key});

  // Static list of events
  static final List<Event> events = [
    Event(
      name: 'Coachella Valley Music Festival',
      description:
          'The ultimate music and arts festival featuring top artists from around the world in the California desert.',
      url: 'https://coachella.com',
      imageUrl:
          'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800',
    ),
    Event(
      name: 'Glastonbury Festival',
      description:
          'Legendary British festival showcasing contemporary performing arts with a focus on music.',
      url: 'https://glastonburyfestivals.co.uk',
      imageUrl:
          'https://images.unsplash.com/photo-1506157786151-b8491531f063?w=800',
    ),
    Event(
      name: 'Lollapalooza',
      description:
          'Multi-genre music festival featuring alternative rock, heavy metal, punk rock, hip hop, and electronic dance music.',
      url: 'https://lollapalooza.com',
      imageUrl:
          'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?w=800',
    ),
    Event(
      name: 'Bonnaroo Music Festival',
      description:
          'Four-day music festival featuring diverse musical styles including indie rock, world music, hip hop, jazz, and more.',
      url: 'https://bonnaroo.com',
      imageUrl:
          'https://images.unsplash.com/photo-1501386761578-eac5c94b800a?w=800',
    ),
    Event(
      name: 'Tomorrowland',
      description:
          'The world\'s premier electronic dance music festival bringing together the biggest DJs and producers.',
      url: 'https://tomorrowland.com',
      imageUrl:
          'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?w=800',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            const Text(
              'Upcoming Events',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Discover amazing music events and festivals happening around the world. Click on any event to learn more and get tickets.',
              style: TextStyle(
                fontSize: 18,
                color: isDarkTheme ? Colors.grey[300] : Colors.grey[600],
                fontFamily: 'Raleway',
              ),
            ),
            const SizedBox(height: 40),

            // Events Carousel
            SizedBox(
              height: 400,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.8,
                  initialPage: events.length ~/ 2, // Start at middle
                ),
                itemCount: events.length,
                padEnds: false, // Remove extra padding at start/end
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: EventCard(
                      event: events[index],
                      isDarkTheme: isDarkTheme,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            // Event Grid (Alternative view)
            const Text(
              'All Events',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.2,
              ),
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventGridCard(
                  event: events[index],
                  isDarkTheme: isDarkTheme,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: const ThemeButton(),
    );
  }
}
