part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class LoadingNotifications extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  NotificationsLoaded(this.notifications);

  final List<Notification> notifications;
}

class NotificationsError extends NotificationsState {
  NotificationsError(this.errorMessage);

  final String errorMessage;
}

class NotificationDeleted extends NotificationsState {}
