import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:undercover_mobile/src/utils/app_colors.dart';
import 'package:undercover_mobile/src/widgets/green_button.dart';

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
    return SafeArea(
      child: BlocBuilder<MyArtistsBloc, MyArtistsBlocState>(
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
      ),
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
          const SizedBox(height: 20),
          getKeyPad(artist),
          const SizedBox(height: 30),
          getArtistBio(artist),
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
        width: 160,
        height: 160,
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

  Widget getKeyPad(Artist artist) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const GreenButton(label: 'Follow'),
          /*  if (artist.facebookAccount != null &&
              artist.facebookAccount!.isNotEmpty) */
          getFacebookButton(artist),
          getYoutubeButton(artist),

          /*  ElevatedButton(
            onPressed: () {},
            child: const Text('Follow'),
          ), */
        ],
      ),
    );
  }

  Widget getFacebookButton(Artist artist) {
    return Container(
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(
          FontAwesomeIcons.facebook,
          color: facebookColor,
          size: 30,
        ),
        style: ElevatedButton.styleFrom(
          primary: darkControlColor,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white, //Theme.of(context).primaryColor,
          ),
        ),
        label: Container(),
      ),
    );
  }

  Widget getYoutubeButton(Artist artist) {
    return Container(
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(
          FontAwesomeIcons.youtube,
          color: youtubeColor,
          size: 30,
        ),
        style: ElevatedButton.styleFrom(
          primary: darkControlColor,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white, //Theme.of(context).primaryColor,
          ),
        ),
        label: Container(),
      ),
    );
  }

  Widget getArtistBio(Artist artist) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Bio', style: titleStyle, textAlign: TextAlign.start),
          const SizedBox(height: 20),
          Text(artist.bio),
        ],
      ),
    );
  }
}
