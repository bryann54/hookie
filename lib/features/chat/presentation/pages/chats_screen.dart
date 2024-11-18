import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookee/core/constants/bg_widget.dart';
import 'package:hookee/features/chat/presentation/pages/chat_screen.dart';
import 'package:hookee/features/home/data/models/user_model.dart';
import 'package:hookee/features/home/presentation/bloc/home_bloc.dart';

class ChatsScreen extends StatelessWidget {
  final User user;
  const ChatsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    context.read<HomeBloc>().add(LoadUsersEvent());

    return Scaffold(
      body: AnimatedBackgroundWidget(
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Chat screen header
                    Text(
                      'Chats',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // BlocBuilder to manage different states of HomeBloc
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeLoadedState) {
                      // If there are no users
                      if (state.users.isEmpty) {
                        return const Center(child: Text('No chats available'));
                      }
                      // Display list of users (chats)
                      return ListView.builder(
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          final user =
                              state.users[index]; // Get the user from the state

                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                              onTap: () {
                                // Correct navigation using MaterialPageRoute
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatScreen(
                                        user:
                                            user), // Pass user data to the ChatsScreen
                                  ),
                                );
                              },
                              child: Card(
                                shape: const RoundedRectangleBorder(),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 25.0,
                                    backgroundColor: Colors.grey[300],
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        imageUrl: user
                                            .imageUrl, // Use user.imageUrl from state
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        fit: BoxFit.cover,
                                        width: 60.0,
                                        height: 60.0,
                                      ),
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.name,
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ), // Use user.name from state
                                      Text(
                                        user.profession, // Use user.profession from state
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is HomeErrorState) {
                      return Center(child: Text(state.error));
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
