import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../../main.dart';
import '../blocs/artists/my_artists_bloc.dart';
import 'artist_tall_card.dart';
import 'list_view.dart';
import 'no_artists_found_widget.dart';
import 'section_header.dart';

class MyArtistsList extends StatefulWidget {
  const MyArtistsList({Key? key}) : super(key: key);

  @override
  _MyArtistsListState createState() => _MyArtistsListState();
}

class _MyArtistsListState extends State<MyArtistsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('my_artists_column'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: platformIsNotWeb() ? 10 : 25),
          child: sectionHeader(S.of(context).myBands, seeAll: false),
        ),
        BlocBuilder<MyArtistsBloc, MyArtistsBlocState>(
            builder: (context, status) {
          if (status is LoadingArtists) {
            return const CircularProgressIndicator();
          } else if (status is NoArtistsFoundForThisUser) {
            return const NoArtistsFoundMessage();
          } else if (status is ArtistsLoaded) {
            final List<Widget> _artistWidgets = List.generate(
              status.artists.length,
              (index) => InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  'artist',
                  arguments: status.artists[index].id,
                ),
                child: ArtistTallCard(
                  artistId: status.artists[index].id,
                  artistName: status.artists[index].name,
                  followersCount: status.artists[index].followers,
                  backgroundImageUrl: status.artists[index].pictureUrl,
                ),
              ),
            );
            return UndercoverListView(
              listOfWidgets: _artistWidgets,
              numOfWidgetsOnTablet: 4,
              numOfWidgetsOnDesktop: 6,
              numOfWidgetsOnWideScreen: 8,
              itemHeight: 220,
              itemWidth: 150,
              padding: 10,
              leftPaddingOnPhone: 25,
            );
          } else {
            return Container();
          }
        }),
      ],
    );
  }
}
