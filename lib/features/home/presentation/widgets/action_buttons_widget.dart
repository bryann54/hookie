// lib/widgets/action_buttons_widget.dart
import 'package:flutter/material.dart';
import 'package:hookee/core/constants/colors.dart';
import 'package:hookee/features/home/presentation/widgets/action_button_widgets.dart';
class ActionButtonsWidget extends StatelessWidget {
  final bool isDarkMode;

  const ActionButtonsWidget({
    super.key,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ActionButton(
            icon: Icons.close,
            iconColor: AppColors.errorDark,
            bgColor: isDarkMode ? AppColors.surfaceColorDark : Colors.white,
          ),
          const SizedBox(width: 12),
          ActionButton(
            icon: Icons.favorite,
            iconColor: AppColors.primaryColorDark,
            bgColor: isDarkMode ? AppColors.surfaceColorDark : Colors.white,
          ),
          const SizedBox(width: 12),
          ActionButton(
            icon: Icons.star,
            iconColor: AppColors.accentColorDark,
            bgColor: isDarkMode ? AppColors.surfaceColorDark : Colors.white,
          ),
        ],
      ),
    );
  }
}
