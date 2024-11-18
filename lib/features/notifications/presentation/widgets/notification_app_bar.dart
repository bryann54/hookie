import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hookee/features/notifications/presentation/bloc/notifications_bloc.dart';
import '../../../../core/constants/colors.dart';

class NotificationAppBar extends StatelessWidget {
  final bool isDarkMode;

  const NotificationAppBar({required this.isDarkMode, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              size: 30,
              Icons.arrow_back_ios,
              color: isDarkMode ? AppColors.textPrimaryDark : Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 50),
          const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: isDarkMode ? AppColors.textPrimaryDark : Colors.white,
            ),
            onSelected: (value) {
              if (value == 'clear_all') {
                context
                    .read<NotificationsBloc>()
                    .add(const ClearAllNotifications());
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'clear_all',
                child: Text('Clear all'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
