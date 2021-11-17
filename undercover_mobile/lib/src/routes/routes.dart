import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/artist_details_page.dart';
import '../pages/home_page.dart';
import '../pages/place_details_page.dart';

const String homeRoute = '/';
const String artistRoute = '/artistDetails';
const String placeRoute = '/placeDetails';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    homeRoute: (BuildContext context) => const HomePage(),
    artistRoute: (BuildContext context) => ArtistDetailsPage(),
    //placeRoute: (BuildContext context) => const PlaceDetailsPage(),
  };
}

List<GetPage> routes = [
  GetPage(name: homeRoute, page: () => const HomePage()),
  GetPage(name: placeRoute, page: () => const PlaceDetailsPage()),
];
