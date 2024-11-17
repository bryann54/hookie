import 'package:flutter/material.dart';
import 'package:hookee/features/notifications/data/models/notification_model.dart';
import 'notification_card.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationModel> notifications;

  const NotificationList({required this.notifications, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationCard(notification: notification);
      },
    );
  }
}
