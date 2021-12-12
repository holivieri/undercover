import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/artist_details_page.dart';
import '../pages/concert_details_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/place_details_page.dart';
import '../pages/user_proferences_page.dart';

const String homeRoute = '/';
const String artistRoute = '/artistDetails';
const String placeRoute = '/placeDetails';
const String concertRoute = '/concertDetails';
const String loginRoute = '/login';
const String userPreferencesRoute = '/userPreferences';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    loginRoute: (BuildContext context) => const LoginPage(),
    homeRoute: (BuildContext context) => const HomePage(),
    artistRoute: (BuildContext context) => ArtistDetailsPage(),
    concertRoute: (BuildContext context) => ConcertDetailsPage(),
    userPreferencesRoute: (BuildContext context) => const UserPreferencesPage(),
    //placeRoute: (BuildContext context) => const PlaceDetailsPage(),
  };
}

List<GetPage> routes = [
  GetPage(name: homeRoute, page: () => const HomePage()),
  GetPage(name: placeRoute, page: () => const PlaceDetailsPage()),
];
