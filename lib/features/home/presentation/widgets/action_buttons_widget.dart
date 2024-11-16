import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookee/core/constants/colors.dart';
import 'package:hookee/core/constants/custom_snackbar_widget.dart';
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

void _showSnackbar({
    required BuildContext context,
    required String message,
    required IconData icon,
    Color backgroundColor = const Color.fromARGB(190, 0, 0, 0),
  }) {
    CustomAnimatedSnackbar.show(
      context: context,
      message: message,
      icon: icon,
      backgroundColor: backgroundColor,
    );
  }


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
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              final isFavorite = state is FavoritesLoaded &&
                  state.favorites.any((favUser) => favUser.id == user.id);

              return ActionButton(
                icon: isFavorite ? Icons.favorite : Icons.favorite,
                iconColor: isDarkMode ? Colors.white : AppColors.accentColor,
                bgColor: isDarkMode ? AppColors.surfaceColorDark : Colors.white,
                onTap: () {
                  if (isFavorite) {
                    context.read<FavoritesBloc>().add(RemoveFromFavorites(user));
                    _showSnackbar( message: '${user.name} removed from favorites', context: context, icon: Icons.favorite,
                    );
                  } else {
                    context.read<FavoritesBloc>().add(AddToFavorites(user));
                   _showSnackbar(
                      context: context,
                      message: '${user.name} added to favorites',
                      icon: Icons.favorite,
                      backgroundColor: Colors.green,
                    );

                  }
                  debugPrint("Favorite button tapped");
                },
              );
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
