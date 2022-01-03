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

    //Local Notifications
  }
}
