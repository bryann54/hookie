// lib/features/notifications/domain/models/notification_model.dart

import 'package:equatable/equatable.dart';

enum NotificationType { like, match, message }

class NotificationModel extends Equatable {
  final String id;
  final String message;
  final String userId;
  final String? userImage;
  final DateTime timestamp;
  final NotificationType type;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.message,
    required this.userId,
    this.userImage,
    required this.timestamp,
    required this.type,
    this.isRead = false,
  });

  NotificationModel copyWith({
    String? id,
    String? message,
    String? userId,
    String? userImage,
    DateTime? timestamp,
    NotificationType? type,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      message: message ?? this.message,
      userId: userId ?? this.userId,
      userImage: userImage ?? this.userImage,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  List<Object?> get props => [
        id,
        message,
        userId,
        userImage,
        timestamp,
        type,
        isRead,
      ];
}
