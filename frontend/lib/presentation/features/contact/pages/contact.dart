import 'package:app/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  static const route = '/contact';

  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Contact'),
      ),
    );
  }
}
