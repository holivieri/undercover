import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

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

  static Future<void> _onBackgroundHandler(RemoteMessage message) async {
    print('background handler: ${message.messageId}');
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    print('_onMessageHandler handler: ${message.messageId}');
  }

  static Future<void> _onMessageOpenApp(RemoteMessage message) async {
    print('_onMessageOpenApp handler: ${message.messageId}');
  }
}
