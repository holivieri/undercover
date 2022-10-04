import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../utils/app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme({required bool isOn}) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Color getSelectedIconColor() {
    if (isDarkMode) {
      return iconSelectedColor;
    } else {
      return iconLightThemeColor;
    }
  }

  Color getControlColor() {
    if (isDarkMode) {
      return darkControlColor;
    } else {
      return brightControlColor;
    }
  }
}

// ignore: avoid_classes_with_only_static_members
class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    backgroundColor: darkBackground,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.black), //greenButtonColor),
    buttonTheme: const ButtonThemeData(buttonColor: greenButtonColor),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: brightBackgroundWhite,
    backgroundColor: Colors.pink.shade200,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.red),
    buttonTheme: const ButtonThemeData(buttonColor: greenButtonColor),
  );
}
