part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsEvent {}

class GettingUserNotifications extends NotificationsEvent {}

class DeletingNotification extends NotificationsEvent {
  DeletingNotification(this.notificationId);

  final String notificationId;
}
