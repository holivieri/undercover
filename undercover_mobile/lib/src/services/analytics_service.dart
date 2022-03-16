import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> setUserProperties(String userId) async {
    await _analytics.setUserId(id: userId);
  }
}
