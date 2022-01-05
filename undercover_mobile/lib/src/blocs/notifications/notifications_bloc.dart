import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/notification_model.dart';
import '../../repositories/notifications_repository.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc(this.notificationsRespository)
      : super(NotificationsInitial()) {
    on<GettingUserNotifications>((event, emit) async {
      emit(LoadingNotifications());
      try {
        final notifications = await notificationsRespository.getNotifications();
        emit(NotificationsLoaded(notifications));
      } on Exception catch (ex) {
        print(ex);
        emit(NotificationsError('Not possible to load notfications'));
      }
    });
    on<DeletingNotification>((event, emit) async {
      try {
        await notificationsRespository.deleteNotification(event.notificationId);
        emit(NotificationDeleted());
      } on Exception catch (ex) {
        print(ex);
        emit(NotificationsError('Not possible to Delete notfication'));
      }
    });
  }
  final NotificationsRespository notificationsRespository;
}
