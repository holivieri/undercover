import 'package:flutter/material.dart';
import 'package:undercover_mobile/src/blocs/places/places_bloc.dart';
import '../pages/artist_details_page.dart';
import 'package:undercover_mobile/src/pages/place_details_page.dart';

import '../pages/home_page.dart';

const String homeRoute = 'home';
const String artistRoute = 'artistDetails';
const String placeRoute = 'placeDetails';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    homeRoute: (BuildContext context) => const HomePage(),
    artistRoute: (BuildContext context) => ArtistDetailsPage(),
    placeRoute: (BuildContext context) => const PlaceDetailsPage(),
  };
}
