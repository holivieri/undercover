import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../blocs/artists/my_artists_bloc.dart';
import '../models/artist_model.dart';
import '../repositories/artists_repository.dart';
import '../services/artists_service.dart';
import '../utils/font.dart';
import '../widgets/back_button.dart';
import '../widgets/tweets_list.dart';
import '../widgets/youtube_videos_list.dart';

class ArtistDetailsPage extends StatefulWidget {
  @override
  State<ArtistDetailsPage> createState() => _ArtistDetailsPageState();
}

class _ArtistDetailsPageState extends State<ArtistDetailsPage> {
  final String? _artistId = Get.arguments;
  late final MyArtistsBloc artistBloc;

  @override
  void initState() {
    super.initState();
    final ArtistService service = ArtistService();
    final ArtistRepository repository = ArtistRepository(service);

    artistBloc = MyArtistsBloc(repository)
      ..add(
        LoadArtist(_artistId!),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyArtistsBloc, MyArtistsBlocState>(
      bloc: artistBloc,
      builder: (context, state) {
        if (state is LoadingArtist) {
          return const CircularProgressIndicator();
        } else if (state is ArtistLoaded) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackArrowButton(),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            extendBodyBehindAppBar: true,
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: mainBody(state.artist),
            ),
          );
        } else {
          return const Text('Error - Artista no encontrado');
        }
      },
    );
  }

  Widget mainBody(Artist artist) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 25),
          getArtistCoverPicture(artist),
          const SizedBox(height: 20),
          Text(
            artist.name,
            style: titleStyle,
          ),
          Text(
            artist.followers.toString(),
            style: titleStyleGreen,
          ),
          const Text('followers', style: subtitleStyle),
          /* getArtistBio(artist),
          const SizedBox(height: 20), */
          getKeyPad(),
          const TweetsList(),
          const SizedBox(height: 20),
          const YoutubeVideosList(),
        ],
      ),
    );
  }

  Widget getArtistCoverPicture(Artist artist) {
    return Hero(
      tag: 'image-${artist.id}',
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(artist.pictureUrl!),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget getKeyPad() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Follow'),
        ),
      ],
    );
  }

  Widget getArtistBio(Artist artist) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.lightBlue[50]!.withOpacity(0.5),
      ),
      width: 250,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              artist.name,
              style: subtitleStyle,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.follow_the_signs),
                Text(artist.followers.toString()),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.twitter),
                Text(artist.twitterAccount!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
