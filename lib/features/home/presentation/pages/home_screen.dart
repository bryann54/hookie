import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookee/core/constants/bg_widget.dart';
import 'package:hookee/features/home/presentation/bloc/home_bloc.dart';
import 'package:hookee/features/notifications/presentation/bloc/notifications_bloc.dart';
import 'package:hookee/features/notifications/presentation/bloc/notifications_state.dart';
import 'package:hookee/features/notifications/presentation/pages/notificatio_screen.dart';
import 'package:hookee/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:hookee/features/home/presentation/widgets/user_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<HomeBloc>().add(LoadUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      body: AnimatedBackgroundWidget(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Location and Notification Row
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 42,
                              width: 42,
                              decoration: BoxDecoration(
                                color: Colors.pink.shade100.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.pink,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'London, United Kingdom',
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the notification screen when tapped
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationScreen()),
                            );
                          },
                          child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? Colors.grey.shade400
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Stack(
                              children: [
                                const Center(
                                  child: Icon(
                                    Icons.notifications_outlined,
                                    color: Colors.black87,
                                    size: 24,
                                  ),
                                ),
                                BlocBuilder<NotificationsBloc,
                                    NotificationsState>(
                                  builder: (context, state) {
                                    int unreadCount = 0;
                                    if (state is NotificationsLoaded) {
                                      unreadCount = state.notifications
                                          .where((notification) =>
                                              !notification.isRead)
                                          .length;
                                    }

                                    return Positioned(
                                      right: -1,
                                      top: -1,
                                      child: unreadCount > 0
                                          ? Container(
                                              height: 17,
                                              width: 17,
                                              decoration: const BoxDecoration(
                                                color: Colors.red,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '$unreadCount',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : const SizedBox
                                              .shrink(), // If no unread notifications, don't show the badge
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomSearchBar(
                      onSearch: (query) {
                        print('Searching for: $query');
                      },
                      onFilterTap: () {
                        print('Filter tapped');
                      },
                    ),
                  ],
                ),
              ),
              // User cards section with BlocBuilder
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is HomeLoadedState) {
                      return PageView.builder(
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UserCardWidget(user: state.users[index]),
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
