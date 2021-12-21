import 'package:flutter/cupertino.dart';

import '../models/user_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('es');

  Locale get currentLocale => _currentLocale;

  void changeLocale(String _language) {
    _currentLocale = Locale(_language);
    UserPreferences().selectedLanguage = _language;
    notifyListeners();
  }
}
