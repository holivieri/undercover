import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream =
      StreamController.broadcast();

  static Stream<String> get messageStream => _messageStream.stream;

  static void closeStreams() {
    _messageStream.close();
  }

  void test() {}
  static Future<void> initializeApp() async {
    //Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('================ Device TOKEN ================');
    print(token);

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //Local Notifications
  }

  static Future _onBackgroundHandler(RemoteMessage message) async {
    print('background handler: ${message.messageId}');
    _messageStream.add(message.notification?.title ?? 'Sin Titulo');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('_onMessageHandler handler: ${message.messageId}');
    _messageStream.add(message.notification?.title ?? 'Sin Titulo');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('_onMessageOpenApp handler: ${message.messageId}');
    _messageStream.add(message.notification?.title ?? 'Sin Titulo');
  }
}
