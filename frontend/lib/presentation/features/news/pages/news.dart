import 'package:flutter/material.dart';

import '../../../../home.dart';

class NewsScreen extends StatelessWidget {
  static const route = '/news';

  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Text('News'),
      ),
    );
  }
}
