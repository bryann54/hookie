import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hookee/core/constants/bg_widget.dart';
import 'package:hookee/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:hookee/features/favorites/presentation/widgets/favorites_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBackgroundWidget(
      child: SafeArea(
        child: Column(
          children: [
         const   Padding(
              padding:  EdgeInsets.all(16.0),
              child:  Text(
                'Liked Profiles',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<FavoritesBloc, FavoritesState>(
                builder: (context, state) {
                  if (state is FavoritesLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state is FavoritesLoaded) {
                    if (state.favorites.isEmpty) {
                      return const Center(
                        child: Text(
                          'No favorites yet.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemCount: state.favorites.length,
                        itemBuilder: (context, index) {
                          final favoriteUser = state.favorites[index];
                          return Dismissible(
                            key: ValueKey(favoriteUser.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
                            ),
                            onDismissed: (_) {
                              context.read<FavoritesBloc>().add(
                                    RemoveFromFavorites(favoriteUser),
                                  );
                            },
                            child: FavoritesWidget(user: favoriteUser),
                          );
                        },
                      ),
                    );
                  } else if (state is FavoritesError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: Text(
                      'Something went wrong.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
