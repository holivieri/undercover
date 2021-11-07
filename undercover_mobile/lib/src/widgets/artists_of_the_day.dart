import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:undercover_mobile/src/blocs/artists/my_artists_bloc.dart';
import 'package:undercover_mobile/src/widgets/section_header.dart';
import '../../main.dart';
import 'artist_tall_card.dart';
import 'list_view.dart';

class ArtistsOfTheDay extends StatefulWidget {
  const ArtistsOfTheDay({Key? key}) : super(key: key);

  @override
  _ArtistsOfTheDayState createState() => _ArtistsOfTheDayState();
}

class _ArtistsOfTheDayState extends State<ArtistsOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('artists_of_the_day_column'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: platformIsNotWeb() ? 10 : 25),
          child: sectionHeader('artistOfTheDay'),
        ),
        BlocBuilder<MyArtistsBloc, MyArtistsBlocState>(
            builder: (context, status) {
          if (status is LoadingArtists) {
            return const CircularProgressIndicator();
          }
          if (status is ArtistsLoaded) {
            final List<Widget> _artistWidgets = List.generate(
              status.artists.length,
              (index) => InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  'artist',
                  arguments: status.artists[index].id,
                ),
                child: ArtistTallCard(
                  artistName: status.artists[index].name,
                  followersCount: status.artists[index].followers,
                  backgroundImageUrl: status.artists[index].pictureUrl,
                ),
              ),
            );
            return TribesListView(
              listOfWidgets: _artistWidgets,
              numOfWidgetsOnTablet: 4,
              numOfWidgetsOnDesktop: 6,
              numOfWidgetsOnWideScreen: 8,
              itemHeight: 220,
              itemWidth: 150,
              padding: 10,
              leftPaddingOnPhone: 25,
            );
          }
        }),
      ],
    );
  }
}
