import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../main.dart';
import '../widgets/concerts_list.dart';
import '../widgets/genres_list.dart';
import '../widgets/my_artists_list.dart';
import '../widgets/places_list.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mainBody(context);
  }

  Widget mainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getLogo(),
          getMyBands(),
          const SizedBox(height: 20),
          getGenres(context),
          const SizedBox(height: 20),
          getPlaces(context),
          const SizedBox(height: 20),
          getNextConcerts(context),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget getLogo() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      alignment: Alignment.topRight,
      child: Hero(
        tag: 'logoTag',
        child: Image.asset(
          'assets/images/Logo_small.png',
          height: 50,
        ),
      ),
    );
  }

  Widget getGenres(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: platformIsNotWeb() ? 10 : 25),
          child: sectionHeader(S.of(context).genres, seeAll: false),
        ),
        const GenresList(),
      ],
    );
  }

  Widget getPlaces(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: platformIsNotWeb() ? 10 : 25),
          child: sectionHeader(S.of(context).myPlaces, seeAll: false),
        ),
        const PlacesList(),
      ],
    );
  }

  Widget getNextConcerts(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: platformIsNotWeb() ? 10 : 25),
          child: sectionHeader(S.of(context).nextConcerts, seeAll: false),
        ),
        const ConcertsList(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget getMyBands() {
    return const MyArtistsList();
  }
}
