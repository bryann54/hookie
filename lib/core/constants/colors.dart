import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color primaryColor = Color(0xFFF48FB1); // Pink 100
  static const Color secondaryColor = Color(0xFFF06292); // Pink 200
  static const Color accentColor = Color(0xFFEC407A); // Pink 300
  static const Color background = Color(0xFFFCE4EC); // Pink light background
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFD32F2F);
  static const Color textPrimary = Color(0xFF880E4F); // Pink dark text
  static const Color textSecondary = Color(0xFFAD1457);
  static const Color cardColor = Colors.white;
  static const Color dividerColor = Color(0xFFF8BBD0);
  static const Color shadowColor = Color(0x1AF06292);

  // Light Theme Gradient for Buttons
  static const LinearGradient lightButtonGradient = LinearGradient(
    colors: [primaryColor, accentColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Dark Theme Colors - Updated for modern dating app
  static const Color primaryColorDark = Color(0xFFE91E63); // Pink 500
  static const Color secondaryColorDark = Color(0xFF9C27B0); // Purple 500
  static const Color accentColorDark = Color(0xFF2196F3); // Blue 500
  static const Color backgroundDark =
      Color(0xFF121212); // Material dark background
  static const Color surfaceColorDark =
      Color(0xFF1E1E1E); // Slightly lighter dark
  static const Color errorDark = Color(0xFFCF6679); // Material dark error
  static const Color textPrimaryDark = Color(0xFFFFFFFF); // White text
  static const Color textSecondaryDark = Color(0xB3FFFFFF); // 70% white
  static const Color cardColorDark = Color(0xFF2C2C2C); // Card background
  static const Color dividerColorDark = Color(0xFF323232); // Subtle divider
  static const Color shadowColorDark = Color(0x3D000000); // Dark shadow

  // Dark Theme Gradient for Buttons
  static const LinearGradient darkButtonGradient = LinearGradient(
    colors: [primaryColorDark, accentColorDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
