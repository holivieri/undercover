import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/user_proferences_page.dart';
import '../pages/wizard_step_one_page.dart';

const String homeRoute = '/home';
const String artistRoute = '/artistDetails';
const String placeRoute = '/placeDetails';
const String concertRoute = '/concertDetails';
const String loginRoute = '/';
const String userPreferencesRoute = '/userPreferences';
const String createProfileRoute = '/createProfile';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    loginRoute: (BuildContext context) => const LoginPage(),
    homeRoute: (BuildContext context) => const HomePage(),
    createProfileRoute: (BuildContext context) => const WizardProfile(),
    // artistRoute: (BuildContext context) => ArtistDetailsPage(),
    //concertRoute: (BuildContext context) => ConcertDetailsPage(),
    userPreferencesRoute: (BuildContext context) => const UserPreferencesPage(),
    //placeRoute: (BuildContext context) => const PlaceDetailsPage(),
  };
}
