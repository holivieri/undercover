// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Bio`
  String get bio {
    return Intl.message(
      'Bio',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Enter Artist Name`
  String get enterArtistName {
    return Intl.message(
      'Enter Artist Name',
      name: 'enterArtistName',
      desc: '',
      args: [],
    );
  }

  /// `Error - Artist not found`
  String get errorArtistNotFound {
    return Intl.message(
      'Error - Artist not found',
      name: 'errorArtistNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Error - Concert not found`
  String get errorConcertNotFound {
    return Intl.message(
      'Error - Concert not found',
      name: 'errorConcertNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Error - Cannot find any video`
  String get errorLoadingVideos {
    return Intl.message(
      'Error - Cannot find any video',
      name: 'errorLoadingVideos',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Genres`
  String get genres {
    return Intl.message(
      'Genres',
      name: 'genres',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get langEnglish {
    return Intl.message(
      'English',
      name: 'langEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get langSpanish {
    return Intl.message(
      'Spanish',
      name: 'langSpanish',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message(
      'Log In',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `My Artists`
  String get myBands {
    return Intl.message(
      'My Artists',
      name: 'myBands',
      desc: '',
      args: [],
    );
  }

  /// `My Rocking places`
  String get myPlaces {
    return Intl.message(
      'My Rocking places',
      name: 'myPlaces',
      desc: '',
      args: [],
    );
  }

  /// `Next Concerts`
  String get nextConcerts {
    return Intl.message(
      'Next Concerts',
      name: 'nextConcerts',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Error - There is an error getting places`
  String get placesError {
    return Intl.message(
      'Error - There is an error getting places',
      name: 'placesError',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Tweets`
  String get tweets {
    return Intl.message(
      'Tweets',
      name: 'tweets',
      desc: '',
      args: [],
    );
  }

  /// `Videos`
  String get videos {
    return Intl.message(
      'Videos',
      name: 'videos',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
