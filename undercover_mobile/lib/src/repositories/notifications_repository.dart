import '../models/notification_model.dart';
import '../services/notifications_service.dart';

class NotificationsRespository {
  NotificationsRespository(this.notificationsService);

  final NotificationsService notificationsService;

  Future<List<Notification>> getNotifications() async {
    return notificationsService.getMyNotifications();
  }

  Future<bool> deleteNotification(String notificationId) async {
    return notificationsService.deleteNotification(notificationId);
  }
}
