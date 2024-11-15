import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookee/core/constants/colors.dart';
import 'package:hookee/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/home/presentation/widgets/action_button_widgets.dart';

class ActionButtonsWidget extends StatelessWidget {
  final bool isDarkMode;
  final User user;

  const ActionButtonsWidget({
    super.key,
    required this.isDarkMode,
    required this.user,
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
            onTap: () {
              debugPrint("Close button tapped");
            },
            changeColorOnTap: false,
          ),
          const SizedBox(width: 12),
          ActionButton(
            icon: Icons.favorite,
            iconColor: Colors.white,
            bgColor: isDarkMode ? AppColors.surfaceColorDark : Colors.white,
            onTap: () {
              context.read<FavoritesBloc>().add(AddToFavorites(user));
              debugPrint("Favorite button tapped");
            },
          ),
          const SizedBox(width: 12),
          ActionButton(
            icon: Icons.star,
            iconColor: AppColors.accentColorDark,
            bgColor: isDarkMode ? AppColors.surfaceColorDark : Colors.white,
            onTap: () {
              debugPrint("Star button tapped");
            },
          ),
        ],
      ),
    );
  }
}
