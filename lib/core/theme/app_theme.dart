import 'package:flutter/material.dart';
import 'package:hookee/core/constants/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      tertiary: AppColors.accentColor,
      error: AppColors.error,
      surface: AppColors.surface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textPrimary,
    ),
    textTheme: const TextTheme(
      displayLarge:
          TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: AppColors.textSecondary),
    ),
    cardTheme: const CardTheme(
      color: AppColors.cardColor,
      elevation: 2,
      shadowColor: AppColors.shadowColor,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerColor,
      thickness: 1,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColorDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColorDark,
      secondary: AppColors.secondaryColorDark,
      tertiary: AppColors.accentColorDark,
      error: AppColors.errorDark,
      surface: AppColors.surfaceColorDark,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textPrimaryDark,
      surfaceContainerHighest: Color(0xFF2C2C2C),
      inverseSurface: Colors.white,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColors.textPrimaryDark,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondaryDark,
        letterSpacing: 0.15,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.cardColorDark,
      elevation: 4,
      shadowColor: AppColors.shadowColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.dividerColorDark,
      thickness: 1,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceColorDark,
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surfaceColorDark,
      selectedItemColor: AppColors.primaryColorDark,
      unselectedItemColor: AppColors.textSecondaryDark,
    ),
  );
}
