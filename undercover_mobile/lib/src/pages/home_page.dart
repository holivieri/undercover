import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:undercover_mobile/src/services/artists_service.dart';
import 'package:undercover_mobile/src/widgets/genres_list.dart';

import '../blocs/artists/my_artists_bloc.dart';
import '../repositories/artists_repository.dart';
import '../utils/colors.dart';
import '../widgets/artists_of_the_day.dart';
import '../widgets/undercover_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.artistsRepository,
    Key? key,
  }) : super(key: key);

  final ArtistRepository artistsRepository;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UnderAppbar(),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: themeBackgroundGradient),
        child: mainBody(),
      ),
    );
  }
}

Widget mainBody() {
  return Column(
    children: [
      getMyBands(),
      const SizedBox(height: 20),
      getGenres(),
    ],
  );
}

Widget getGenres() {
  return const GenresList();
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
