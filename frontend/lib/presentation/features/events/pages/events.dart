import 'package:flutter/material.dart';

import '../../home/pages/home.dart';

class EventsScreen extends StatelessWidget {
  static const route = '/events';

  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Text('Events'),
      ),
    );
  }
}
