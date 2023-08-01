import 'package:flutter/material.dart';

import '../../../../home.dart';

class AboutScreen extends StatelessWidget {
  static const route = '/about';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Text('About'),
      ),
    );
  }
}
