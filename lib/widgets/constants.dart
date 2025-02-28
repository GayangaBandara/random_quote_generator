import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 98, 98, 110);
  static const Color primaryLight = Color.fromARGB(255, 12, 10, 17);
  static const Color primaryDark = Color.fromARGB(255, 35, 21, 105);

  static const Color secondary = Color.fromARGB(255, 31, 134, 185);
  static const Color secondaryLight = Color.fromARGB(255, 130, 169, 192);
  static const Color secondaryDark = Color.fromARGB(255, 35, 120, 156);

  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color.fromARGB(255, 255, 255, 255);

  static const List<Color> gradientPrimary = [primaryDark, primary, primaryLight];
  static const List<Color> gradientSecondary = [secondaryDark, secondary, secondaryLight];

  static const Color buttonBackground = primary;
  static const Color buttonText = Colors.white;
}
