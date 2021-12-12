import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  static final UserPreferences _instance = UserPreferences._internal();

  SharedPreferences? _userPreferences;

  bool get isInitialized => _userPreferences != null;

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _userPreferences = await SharedPreferences.getInstance();
  }

  Future<void> clear() async {
    await _userPreferences!.clear();
  }

  String get token => _userPreferences!.getString('token') ?? '';

  set token(String value) {
    _userPreferences!.setString('token', value);
  }

  String get userName => _userPreferences!.getString('userName') ?? '';

  set userName(String value) {
    _userPreferences!.setString('userName', value);
  }
}
