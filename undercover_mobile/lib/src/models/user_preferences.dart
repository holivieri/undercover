import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum myProfile {
  artist,
  owner,
  user,
  none,
}

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

  String get selectedLanguage =>
      _userPreferences!.getString('language') ?? 'en';

  set selectedLanguage(String value) {
    _userPreferences!.setString('language', value);
  }

  String get deviceToken =>
      _userPreferences!.getString('deviceToken') ?? 'device-not-set';

  set deviceToken(String value) {
    _userPreferences!.setString('deviceToken', value);
  }

  String get platform =>
      _userPreferences!.getString('platform') ?? 'platform-not-set';

  set platform(String value) {
    _userPreferences!.setString('platform', value);
  }

  String get tokenExpirationDate =>
      _userPreferences!.getString('tokenExpirationDate') ?? '';

  set tokenExpirationDate(String value) {
    _userPreferences!.setString('tokenExpirationDate', value);
  }

  bool get isDarkModeOn => _userPreferences!.getBool('isDarkModeOn') ?? false;

  set isDarkModeOn(bool value) {
    _userPreferences!.setBool('isDarkModeOn', value);
  }

  myProfile get profile {
    switch (_userPreferences!.getString('profile')) {
      case 'artist':
        return myProfile.artist;
      case 'owner':
        return myProfile.owner;
      case 'user':
        return myProfile.user;
      default:
        return myProfile.none;
    }
  }

  set profile(myProfile value) {
    switch (value) {
      case myProfile.artist:
        _userPreferences!.setString('profile', 'artist');
        break;
      case myProfile.owner:
        _userPreferences!.setString('profile', 'owner');
        break;
      case myProfile.user:
        _userPreferences!.setString('profile', 'user');
        break;
      default:
        _userPreferences!.setString('profile', 'none');
        break;
    }
  }
}
