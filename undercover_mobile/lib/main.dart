import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/blocs/artists/my_artists_bloc.dart';
import 'src/blocs/concerts/concerts_bloc.dart';
import 'src/blocs/genres/genres_bloc.dart';
import 'src/blocs/places/places_bloc.dart';
import 'src/blocs/users/users_bloc.dart';
import 'src/models/user_preferences.dart';
import 'src/repositories/artists_repository.dart';
import 'src/repositories/concerts_repository.dart';
import 'src/repositories/genres_repository.dart';
import 'src/repositories/places_repository.dart';
import 'src/repositories/user_repository.dart';
import 'src/services/artists_service.dart';
import 'src/services/concerts_service.dart';
import 'src/services/genres_service.dart';
import 'src/services/places_service.dart';
import 'src/services/user_service.dart';
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
  final PlacesService _placesService = PlacesService();
  final ConcertsService _concertsService = ConcertsService();
  final UserService _userService = UserService();

  final ArtistRepository _artistRepository = ArtistRepository(_artistService);
  final GenresRespository _genresRepository = GenresRespository(_genresService);
  final PlacesRepository _placesRepository = PlacesRepository(_placesService);
  final UserRepository _userRepository = UserRepository(_userService);
  final ConcertsRepository _concertsRepository =
      ConcertsRepository(_concertsService);

  final userPreferences = UserPreferences();
  await userPreferences.init();

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
        BlocProvider<PlacesBloc>(
          create: (BuildContext context) =>
              PlacesBloc(_placesRepository)..add(LoadPlaces()),
        ),
        BlocProvider<ConcertsBloc>(
          create: (BuildContext context) =>
              ConcertsBloc(_concertsRepository)..add(LoadNextConcerts()),
        ),
        BlocProvider<UsersBloc>(
          create: (BuildContext context) =>
              UsersBloc(_userRepository)..add(InitializeUser()),
        ),
      ],
      child: MyApp(
        settingsController: settingsController,
        artistRepository: _artistRepository,
      ),
    ),
  );
}
