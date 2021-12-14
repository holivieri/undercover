import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  Locale currentLocale = const Locale('en');

  void changeLocale(String _language) {
    currentLocale = Locale(_language);
    notifyListeners();
  }
}
