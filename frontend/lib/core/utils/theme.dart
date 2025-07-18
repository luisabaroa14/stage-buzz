import 'package:flutter/material.dart';

import 'constants/colors.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.black,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: accentColor,
  ),
  textTheme: ThemeData.dark().textTheme.copyWith(
        bodyLarge: const TextStyle(color: Colors.white),
        bodyMedium: const TextStyle(color: Colors.white),
        bodySmall: const TextStyle(color: Colors.white),
      ),
);

final ThemeData lightTheme = ThemeData.light().copyWith(
  brightness: Brightness.light,
  primaryColor: Colors.grey[50],
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: accentColor,
  ),
  textTheme: ThemeData.dark().textTheme.copyWith(
        bodyLarge: const TextStyle(color: Colors.black),
        bodyMedium: const TextStyle(color: Colors.black),
        bodySmall: const TextStyle(color: Colors.black),
      ),
);
