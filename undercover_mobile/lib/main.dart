import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/blocs/artists/my_artists_bloc.dart';
import 'src/blocs/genres/genres_bloc.dart';
import 'src/repositories/artists_repository.dart';
import 'src/repositories/genres_repository.dart';
import 'src/services/artists_service.dart';
import 'src/services/genres_service.dart';
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
  final GenresService _genresService = GenresService();

  final ArtistRepository _artistRepository = ArtistRepository(_artistService);
  final GenresRespository _genresRepository = GenresRespository(_genresService);

  await settingsController.loadSettings();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MyArtistsBloc>(
          create: (BuildContext context) =>
              MyArtistsBloc(_artistRepository)..add(LoadMyArtists()),
        ),
        BlocProvider<GenresBloc>(
          create: (BuildContext context) =>
              GenresBloc(_genresRepository)..add(LoadGenres()),
        ),
      ],
      child: MyApp(
        settingsController: settingsController,
        //  artistService: _artistService,
        artistRepository: _artistRepository,
      ),
    ),
  );
}
