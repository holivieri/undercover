import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:undercover_mobile/src/repositories/artists_repository.dart';

import 'src/app.dart';
import 'src/services/artists_service.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

bool platformIsNotWeb() {
  if (kIsWeb) {
    return false;
  }
  return Platform.isIOS || Platform.isAndroid;
}

Future<void> main() async {
  final settingsController = SettingsController(SettingsService());
  final ArtistService _artistService = ArtistService();
  final ArtistRepository _artistRepository = ArtistRepository(_artistService);

  await settingsController.loadSettings();
  runApp(
    MyApp(
      settingsController: settingsController,
      //  artistService: _artistService,
      artistRepository: _artistRepository,
    ),
  );
}
