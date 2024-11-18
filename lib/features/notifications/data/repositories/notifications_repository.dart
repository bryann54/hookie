// lib/features/notifications/data/repositories/notifications_repository.dart

import 'dart:async';
import 'package:hookee/features/notifications/data/models/notification_model.dart';

abstract class NotificationsRepository {
  Future<List<NotificationModel>> getNotifications();
  Future<void> markAsRead(String notificationId);
  Future<void> clearAll();
}

class NotificationsRepositoryImpl implements NotificationsRepository {
  final List<NotificationModel> _notifications = [
    NotificationModel(
      id: '1',
      message: 'Sarah liked your profile',
      userId: 'user123',
      userImage: 'https://example.com/sarah.jpg',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      type: NotificationType.like,
    ),
    NotificationModel(
      id: '2',
      message: "It's a match! You and John liked each other",
      userId: 'user456',
      userImage: 'https://example.com/john.jpg',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      type: NotificationType.match,
    ),
    NotificationModel(
      id: '3',
      message: 'You have a new message from Emily',
      userId: 'user789',
      userImage: 'https://example.com/emily.jpg',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      type: NotificationType.message,
      isRead: true,
    ),
  ];

  @override
  Future<List<NotificationModel>> getNotifications() async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));
    return _notifications;
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index =
        _notifications.indexWhere((note) => note.id == notificationId);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
    }
  }

  @override
  Future<void> clearAll() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _notifications.clear();
  }
}
