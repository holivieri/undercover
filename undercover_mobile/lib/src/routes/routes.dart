import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/artist_details_page.dart';
import '../pages/concert_details_page.dart';
import '../pages/home_page.dart';
import '../pages/place_details_page.dart';

const String homeRoute = '/';
const String artistRoute = '/artistDetails';
const String placeRoute = '/placeDetails';
const String concertRoute = '/concertDetails';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    homeRoute: (BuildContext context) => const HomePage(),
    artistRoute: (BuildContext context) => ArtistDetailsPage(),
    concertRoute: (BuildContext context) => ConcertDetailsPage(),
    //placeRoute: (BuildContext context) => const PlaceDetailsPage(),
  };
}

List<GetPage> routes = [
  GetPage(name: homeRoute, page: () => const HomePage()),
  GetPage(name: placeRoute, page: () => const PlaceDetailsPage()),
];
