import 'package:flutter/material.dart';
import 'package:hookee/core/theme/theme_controller.dart';
import 'package:provider/provider.dart';
class ThemeToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    return Switch(
      value: themeController.isDarkMode,
      onChanged: (value) {
        themeController.toggleTheme();
      },
    );
  }
}
