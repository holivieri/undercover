import 'dart:convert';

import 'package:http/http.dart';

import '../models/notification_model.dart';
import '../utils/http.dart';

class NotificationsService {
  Future<List<Notification>> getMyNotifications() async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/User/GetNotifications'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Notifications endpoint is NOT working',
      );
      return [];
    }

    final List _decodedResponse = json.decode(
      _apiResponse.body,
    );

    return [
      for (final Map<String, dynamic> _record in _decodedResponse)
        Notification.fromJson(_record)
    ];
  }

  Future<bool> deleteNotification(String notificationId) async {
    final _apiResponse = await Client().post(
      Uri.parse('$apiUrl/User/DeleteNotification'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Delete Notification endpoint is NOT working',
      );
      return false;
    }
    return true;
  }
}
