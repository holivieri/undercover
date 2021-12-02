import 'package:flutter/material.dart';

import '../../main.dart';
import '../widgets/artists_of_the_day.dart';
import '../widgets/concerts_list.dart';
import '../widgets/genres_list.dart';
import '../widgets/places_list.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mainBody();
  }

  Widget mainBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getMyBands(),
          const SizedBox(height: 20),
          getGenres(),
          const SizedBox(height: 20),
          getPlaces(),
          const SizedBox(height: 20),
          getNextConcerts(),
        ],
      ),
    );
  }

  Widget getGenres() {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: platformIsNotWeb() ? 10 : 25),
          child: sectionHeader('Generos'),
        ),
        const GenresList(),
      ],
    );
  }

  Widget getPlaces() {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: platformIsNotWeb() ? 10 : 25),
          child: sectionHeader('Bares y Fondas', seeAll: false),
        ),
        const PlacesList(),
      ],
    );
  }

  Widget getNextConcerts() {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: platformIsNotWeb() ? 10 : 25),
          child: sectionHeader('Próximos Shows', seeAll: false),
        ),
        const ConcertsList(),
      ],
    );
  }

  Widget getMyBands() {
    return Column(
      children: [
        const SizedBox(height: 50),
        Row(
          children: const [
            ArtistsOfTheDay(),
          ],
        ),
      ],
    );
  }
}
