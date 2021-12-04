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
          getLogo(),
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

  Widget getLogo() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      alignment: Alignment.topRight,
      child: Image.asset(
        'images/Logo_small.png',
        height: 50,
      ),
    );
  }

  Widget getGenres() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: platformIsNotWeb() ? 10 : 25),
          child: sectionHeader('Generos', seeAll: false),
        ),
        const GenresList(),
      ],
    );
  }

  Widget getPlaces() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    return const ArtistsOfTheDay();
  }
}
