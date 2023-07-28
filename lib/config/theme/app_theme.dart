import 'package:flutter/material.dart';

class AppTheme {
  static const lightSeedColor = Color.fromARGB(255, 5, 65, 95);
  static const seedColor = Colors.blueGrey;

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      
    );
  }
}
