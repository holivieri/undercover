import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:undercover_mobile/src/services/artists_service.dart';

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
  //late MyArtistsBloc artistsBloc;

  @override
  void initState() {
    super.initState();
    // artistsBloc = MyArtistsBloc(widget.artistsRepository);
  }

  @override
  Widget build(BuildContext context) {
    final ArtistService artistService = ArtistService();

    final ArtistRepository artistRepository = ArtistRepository(artistService);

    return BlocProvider(
      create: (context) => MyArtistsBloc(artistRepository),
      child: Scaffold(
        appBar: const UnderAppbar(),
        extendBodyBehindAppBar: true,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(gradient: themeBackgroundGradient),
          child: mainBody(),
        ),
      ),
    );
  }
}

Widget mainBody() {
  return Column(
    children: [
      getMyBands(),
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
