import 'package:app/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  static const route = '/news';

  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('News'),
      ),
    );
  }
}
