import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:undercover_mobile/src/services/artists_service.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

bool platformIsNotWeb() {
  if (kIsWeb) {
    return false;
  }
  return Platform.isIOS || Platform.isAndroid;
}

void main() async {
  final settingsController = SettingsController(SettingsService());
  final ArtistService _artistService = ArtistService();

  await settingsController.loadSettings();
  runApp(
    MyApp(
      settingsController: settingsController,
      artistService: _artistService,
    ),
  );
}
