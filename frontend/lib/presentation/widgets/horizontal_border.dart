import 'package:flutter/material.dart';

class HorizontalBorder extends StatelessWidget {
  const HorizontalBorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: Colors.blueGrey,
    );
  }
}
