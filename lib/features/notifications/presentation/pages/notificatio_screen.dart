import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookee/features/notifications/presentation/bloc/notifications_state.dart';
import 'package:hookee/features/notifications/presentation/widgets/notification_app_bar.dart';
import 'package:hookee/features/notifications/presentation/widgets/notification_empty_state.dart';
import 'package:hookee/features/notifications/presentation/widgets/notification_list.dart';
import '../../../../core/constants/bg_widget.dart';
import '../bloc/notifications_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return BlocListener<NotificationsBloc, NotificationsState>(
      listener: (context, state) {
        if (state is NotificationsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        body: AnimatedBackgroundWidget(
          child: SafeArea(
            child: Column(
              children: [
                NotificationAppBar(isDarkMode: isDarkMode),
                Expanded(
                  child: BlocBuilder<NotificationsBloc, NotificationsState>(
                    builder: (context, state) {
                      if (state is NotificationsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is NotificationsLoaded) {
                        return state.notifications.isEmpty
                            ? const NotificationEmptyState()
                            : NotificationList(
                                notifications: state.notifications);
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
