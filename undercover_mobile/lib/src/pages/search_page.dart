import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../../main.dart';
import '../blocs/artists/my_artists_bloc.dart';
import '../repositories/artists_repository.dart';
import '../services/artists_service.dart';
import '../utils/app_colors.dart';
import '../utils/font.dart';
import '../widgets/artist_tall_card.dart';
import '../widgets/artists_search_result.dart';
import '../widgets/list_view.dart';
import '../widgets/no_artists_found_widget.dart';
import '../widgets/section_header.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _txtController = TextEditingController();
  late final MyArtistsBloc artistBloc;

  @override
  void initState() {
    super.initState();
    final ArtistService service = ArtistService();

    final ArtistRepository repository = ArtistRepository(service);

    artistBloc = MyArtistsBloc(repository);
    artistBloc.add(LoadRecommendedArtists());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  autocorrect: false,
                  controller: _txtController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: S.of(context).enterArtistName,
                  ),
                  onEditingComplete: () {
                    artistBloc.add(
                      SearchArtists(_txtController.text),
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: greenButtonColor),
                  onPressed: () {
                    artistBloc.add(
                      SearchArtists(_txtController.text),
                    );
                  },
                  child: Text(S.of(context).search),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        recommendedArtists(),
        const SizedBox(height: 20),
        showResult(),
      ],
    );
  }

  Widget recommendedArtists() {
    return Column(
      key: const Key('my_recommended_artists'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: platformIsNotWeb() ? 10 : 25),
          child: sectionHeader(S.of(context).recommendedArtists, seeAll: false),
        ),
        BlocBuilder<MyArtistsBloc, MyArtistsBlocState>(
            builder: (context, status) {
          if (status is LoadingRecommendedArtists) {
            return const CircularProgressIndicator();
          } else if (status is NoArtistsFoundForThisUser) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                S.of(context).noRecommendedArtistsAvailable,
                style: subtitleStyle,
              ),
            );
          } else if (status is RecommendedArtistsLoaded) {
            final List<Widget> _artistWidgets = List.generate(
              status.artists.length,
              (index) => InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  'artist',
                  arguments: status.artists[index]!.id,
                ),
                child: ArtistTallCard(
                  artistId: status.artists[index]!.id,
                  artistName: status.artists[index]!.name,
                  followersCount: status.artists[index]!.followers,
                  backgroundImageUrl: status.artists[index]!.pictureUrl,
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

  Widget showResult() {
    return BlocBuilder<MyArtistsBloc, MyArtistsBlocState>(
      bloc: artistBloc,
      builder: (context, state) {
        if (state is SearchingArtists) {
          return const CircularProgressIndicator();
        }
        if (state is ArtistsFound) {
          final artists = state.artists;
          return Expanded(
            child: ArtistSearchResultList(artists: artists),
          );
        }
        return Container();
      },
    );
  }
}
