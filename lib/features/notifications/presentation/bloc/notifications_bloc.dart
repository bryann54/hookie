import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hookee/features/notifications/data/repositories/notifications_repository.dart';
import 'package:hookee/features/notifications/presentation/bloc/notifications_state.dart';

part 'notifications_event.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsRepository _repository;

  NotificationsBloc({
    required NotificationsRepository repository,
  })  : _repository = repository,
        super(const NotificationsInitial()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<MarkNotificationAsRead>(_onMarkNotificationAsRead);
    on<ClearAllNotifications>(_onClearAllNotifications);
  }

  Future<void> _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(const NotificationsLoading());
    try {
      final notifications = await _repository.getNotifications();
      final unreadCount = notifications.where((note) => !note.isRead).length;
      emit(NotificationsLoaded(
        notifications: notifications,
        unreadCount: unreadCount,
      ));
    } catch (e) {
      emit(NotificationsError(e.toString()));
    }
  }

  Future<void> _onMarkNotificationAsRead(
    MarkNotificationAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      await _repository.markAsRead(event.notificationId);
      add(const LoadNotifications()); // Reload notifications
    } catch (e) {
      emit(NotificationsError(e.toString()));
    }
  }

  Future<void> _onClearAllNotifications(
    ClearAllNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      await _repository.clearAll();
      add(const LoadNotifications()); // Reload notifications
    } catch (e) {
      emit(NotificationsError(e.toString()));
    }
  }
}
