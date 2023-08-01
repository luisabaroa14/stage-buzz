import 'package:flutter/material.dart';

import '../../home/pages/home.dart';

class ContactScreen extends StatelessWidget {
  static const route = '/contact';

  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Text('Contact'),
      ),
    );
  }
}
