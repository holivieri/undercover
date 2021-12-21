import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../generated/l10n.dart';
import '../blocs/artists/my_artists_bloc.dart';
import '../models/artist_model.dart';
import '../repositories/artists_repository.dart';
import '../services/artists_service.dart';
import '../utils/app_colors.dart';
import '../utils/font.dart';
import '../widgets/back_button.dart';
import '../widgets/green_button.dart';
import '../widgets/tweets_list.dart';
import '../widgets/youtube_videos_list.dart';

class ArtistDetailsPage extends StatefulWidget {
  const ArtistDetailsPage({
    required this.artistId,
    Key? key,
  }) : super(key: key);

  final String artistId;

  @override
  State<ArtistDetailsPage> createState() => _ArtistDetailsPageState();
}

class _ArtistDetailsPageState extends State<ArtistDetailsPage> {
  late final MyArtistsBloc artistBloc;

  @override
  void initState() {
    super.initState();
    final ArtistService service = ArtistService();
    final ArtistRepository repository = ArtistRepository(service);

    artistBloc = MyArtistsBloc(repository)
      ..add(
        LoadArtist(widget.artistId),
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
            return Text(S.of(context).errorArtistNotFound);
          }
        },
      ),
    );
  }

  Widget mainBody(Artist artist) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 25),
            getArtistCoverPicture(artist),
            const SizedBox(height: 20),
            Text(
              artist.name,
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
            Text(
              artist.followers.toString(),
              style: titleStyleGreen,
            ),
            Text(S.of(context).followers, style: subtitleStyle),
            const SizedBox(height: 20),
            getKeyPad(artist),
            const SizedBox(height: 30),
            getArtistBio(artist),
            getArtistTweets(),
            getArtistVideos(),
            const SizedBox(height: 20),
          ],
        ),
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
          const Expanded(child: GreenButton(label: 'Follow')),
          /*  if (artist.facebookAccount != null &&
              artist.facebookAccount!.isNotEmpty) */
          getSocialNetworkIcons(),
        ],
      ),
    );
  }

  Widget getSocialNetworkIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            FontAwesomeIcons.facebook,
            size: 35,
            color: facebookColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            FontAwesomeIcons.youtube,
            size: 35,
            color: youtubeColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Icon(
            FontAwesomeIcons.twitter,
            size: 35,
            color: twitterColor,
          ),
        ),
      ],
    );
  }

  Widget getArtistBio(Artist artist) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).bio,
              style: titleStyle, textAlign: TextAlign.start),
          const SizedBox(height: 20),
          Text(artist.bio),
        ],
      ),
    );
  }

  Widget getArtistTweets() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).tweets,
            style: titleStyle,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          const TweetsList(),
        ],
      ),
    );
  }

  Widget getArtistVideos() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).videos,
            style: titleStyle,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          const YoutubeVideosList(),
        ],
      ),
    );
  }
}
